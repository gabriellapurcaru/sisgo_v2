package sisgo

class PacienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action:this.&checkAuthorization,except:['login', 'autenticar', 'save', 'logout']]
    def checkAuthorization(){
  	    def usuarioAutenticado = session.usuarioAutenticado
  	    if(usuarioAutenticado){
  	 	//super.checarAutorizacao(usuarioAutenticado)
  	    }else{
  	    	flash.message = "Por favor, logar no Sistema."
  	    	redirect(controller:'usuario',action:'login')
  	    	}
  	}

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pacienteInstanceList: Paciente.list(params), pacienteInstanceTotal: Paciente.count()]
    }

    def create = {
        def pacienteInstance = new Paciente()
        pacienteInstance.properties = params
        return [pacienteInstance: pacienteInstance]
    }

    def save = {

        def y = Paciente.count()
        def a = y +1  as String
        def pacienteInstance = new Paciente(params)


        def ano = new Date()
        def b  = ano.year + 1900 as String
        pacienteInstance.numeroPaciente = a  + b


        if (pacienteInstance.save(flush: true)) {



            flash.message = "Paciente criado com Sucesso!"
            redirect(action: "show", id: pacienteInstance.id)
        }
        else {
            render(view: "create", model: [pacienteInstance: pacienteInstance])
        }
    }

    def show = {
        def pacienteInstance = Paciente.get(params.id)
        if (!pacienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pacienteInstance: pacienteInstance]
        }
    }

    def edit = {
        def pacienteInstance = Paciente.get(params.id)
        if (!pacienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pacienteInstance: pacienteInstance]
        }
    }

    def update = {
        def pacienteInstance = Paciente.get(params.id)
        if (pacienteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pacienteInstance.version > version) {

                    pacienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'paciente.label', default: 'Paciente')] as Object[], "Another user has updated this Paciente while you were editing")
                    render(view: "edit", model: [pacienteInstance: pacienteInstance])
                    return
                }
            }
            pacienteInstance.properties = params
            if (!pacienteInstance.hasErrors() && pacienteInstance.save(flush: true)) {
                flash.message = "Paciente Atualizado com sucesso!"
                redirect(action: "show", id: pacienteInstance.id)
            }
            else {
                render(view: "edit", model: [pacienteInstance: pacienteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pacienteInstance = Paciente.get(params.id)
        if (pacienteInstance) {
            try {
                pacienteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }
    }

    def resultado = {
        def pacientes = Paciente.createCriteria().list() {
            if(params.numeroPaciente && !params.numeroPaciente.equals("")){
                like("numeroPaciente","%${params.numeroPaciente}%").ignoreCase()
            }
            if(params.nomePaciente && !params.nomePaciente.equals("")){
                like("nome","%${params.nomePaciente}%").ignoreCase()
            }
        }

        render(view:'resultado',model:[pacientes:pacientes, params:params, pacientesTotal: pacientes.size()])
    }

    def pesquisaGeral = {
        def pacientes = Paciente.createCriteria().list() {

            if(params.dia && !params.dia.equals("")){
                like("dia","%${params.dia}%").ignoreCase()
            }
            if(params.mes && !params.mes.equals("")){
                like("mes","%${params.mes}%").ignoreCase()
            }
            if(params.ano && !params.ano.equals("")){
                like("ano","%${params.ano}%").ignoreCase()
            }

            /*if(params?.dataInicio?.length() == 10 && params?.dataFim?.length() == 10){
                def dataI = params.dataInicio.split(['/'])
                def inicioMesDiaAno = "${dataI[1]}/${dataI[0]}/${dataI[2]}"
                def dataF = params.dataFim.split(['/'])
                def fimMesDiaAno = "${dataF[1]}/${dataF[0]}/${dataF[2]}"
                def fim = new Date(fimMesDiaAno)
                def inicio = new Date(inicioMesDiaAno)
                between("dataNascimento", inicio, fim)
            }*/

        }
        render(view:'pesquisa',model:[pacientes:pacientes, params:params, pacientesTotal: pacientes.size()])
    }

    def pesquisa = {}


    def desativar={
        def pacienteInstance = Paciente.get(params.id)
        if (pacienteInstance) {
            try {
                pacienteInstance.ativo=false
                pacienteInstance.save(flush:true, failOnError:true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
                redirect(action: "list")
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'paciente.label', default: 'Paciente'), params.id])}"
            redirect(action: "list")
        }

            }


}
