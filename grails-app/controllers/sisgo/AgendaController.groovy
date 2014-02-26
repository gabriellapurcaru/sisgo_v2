package sisgo

class AgendaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }


    def list = {
        //verifica se o paciente possue retorno(s), se sim vai p list, senão vai p create
        if(params?.paciente?.id && !params?.paciente?.id.equals("")){
            def p = Paciente.get(params?.paciente.id)
            def retornos = p.agenda
            if(retornos){
                params.max = Math.min(params.max ? params.int('max') : 10, 100)
                [agendaInstanceList: retornos, agendaInstanceTotal: retornos.size(), p:p]
            }else{
                redirect(action: "create", id: p.id)
            }

        }else{
            def hoje = new Date()
            if(params.dia && params.dia?.length() == 10){
                def x = params.dia.split(['-'])
                def d = "${x[1]}/${x[0]}/${x[2]}"
                def dia = new Date(d)
                def resultados = Agenda.withCriteria {
                    between('dataRetorno', dia, dia+1)
                }
                params.max = Math.min(params.max ? params.int('max') : 10, 100)
                [agendaInstanceList: resultados, agendaInstanceTotal: resultados.size(),hoje:hoje]
            }else if(params.mes && params.mes?.length() == 7){
                def y = params.mes.split(['-'])
                def p = "${y[0]}/01/${y[1]}"
                def mes = new Date(p)
                println "\n\n\n\n\n\n ${mes.month + 1} ssss ${mes.year + 1900} \n\n\n"
                def mes1 = "${mes.month + 1}/01/${mes.year + 1900}"
                def mes2 = "${mes.month + 2}/01/${mes.year + 1900}"
                def m1 = new Date(mes1)
                def m2 = new Date(mes2)
                def resultados = Agenda.withCriteria {
                    between('dataRetorno', m1, m2)
                }
                //println "\n\n\n\n\n\n  ${resultados}  \n ${mes} yyyyyyy ${m1} OOOOOO ${m2} \n\n\n\n\n\n"
                params.max = Math.min(params.max ? params.int('max') : 10, 100)
                [agendaInstanceList: resultados, agendaInstanceTotal: resultados.size(), hoje: hoje]


            }else{
                params.max = Math.min(params.max ? params.int('max') : 10, 100)
                [agendaInstanceList: Agenda.list(params), agendaInstanceTotal: Agenda.count(), hoje: hoje]
            }
        }
    }

    def create = {
        def agendaInstance = new Agenda()
        agendaInstance.properties = params
        if(params.id && !params.id.equals("")){
            def p = Paciente.get(params?.id)
            agendaInstance.paciente = p
        }
        return [agendaInstance: agendaInstance]
    }

    def save = {
        def agendaInstance = new Agenda(params)
        if (agendaInstance.save(flush: true)) {
            flash.message = "Retorno Cadastrado com sucesso!"
            redirect(action: "show", id: agendaInstance.id)
        }else {
            render(view: "create", model: [agendaInstance: agendaInstance])
        }
    }

    def show = {
        def agendaInstance = Agenda.get(params.id)
        if (!agendaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
        else {
            [agendaInstance: agendaInstance]
        }
    }

    def edit = {
        def agendaInstance = Agenda.get(params.id)
        if (!agendaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [agendaInstance: agendaInstance]
        }
    }

    def update = {
        def agendaInstance = Agenda.get(params.id)
        if (agendaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (agendaInstance.version > version) {
                    
                    agendaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'agenda.label', default: 'Agenda')] as Object[], "Another user has updated this Agenda while you were editing")
                    render(view: "edit", model: [agendaInstance: agendaInstance])
                    return
                }
            }
            agendaInstance.properties = params
            if (!agendaInstance.hasErrors() && agendaInstance.save(flush: true)) {
                flash.message = "Retorno atualizado com sucesso!"
                redirect(action: "show", id: agendaInstance.id)
            }
            else {
                render(view: "edit", model: [agendaInstance: agendaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def agendaInstance = Agenda.get(params.id)
        if (agendaInstance) {
            try {
                agendaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'agenda.label', default: 'Agenda'), params.id])}"
            redirect(action: "list")
        }
    }

    def pesquisaGeral = {
        def agendaInstance = Agenda.createCriteria().list() {
            createAlias("cursos", "cursos")

            and{

                if(params.status && !params.status.equals("")){
                    like("status","${params.status}").ignoreCase()
                }


            }
        }
        render(view:'pesquisaGeral',model:[inscritosCurso:inscritosCurso, params:params, inscritosCursoTotal: inscritosCurso.size()])
    }


}
