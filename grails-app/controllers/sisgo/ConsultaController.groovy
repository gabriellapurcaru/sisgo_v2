package sisgo

class ConsultaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        if (params?.paciente?.id  &&  !params?.paciente?.id.equals("")){
        def p = Paciente.get(params?.paciente.id)
        def consultas = p.consultas

        [consultaInstanceList:consultas, consultaInstanceTotal: consultas.size()]

        }else{
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [consultaInstanceList: Consulta.list(params), consultaInstanceTotal: Consulta.count()]
        }
    }

    def create = {
        def consultaInstance = new Consulta()
        consultaInstance.properties = params
        return [consultaInstance: consultaInstance]
    }

    def save = {
        def consultaInstance = new Consulta(params)
        if (consultaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'consulta.label', default: 'Consulta'), consultaInstance.id])}"
            redirect(action: "show", id: consultaInstance.id)
        }
        else {
            render(view: "create", model: [consultaInstance: consultaInstance])
        }
    }

    def show = {
        def consultaInstance = Consulta.get(params.id)
        if (!consultaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), params.id])}"
            redirect(action: "list")
        }
        else {
            [consultaInstance: consultaInstance]
        }
    }

    def edit = {
        def consultaInstance = Consulta.get(params.id)
        if (!consultaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [consultaInstance: consultaInstance]
        }
    }

    def update = {
        def consultaInstance = Consulta.get(params.id)
        if (consultaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (consultaInstance.version > version) {
                    
                    consultaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'consulta.label', default: 'Consulta')] as Object[], "Another user has updated this Consulta while you were editing")
                    render(view: "edit", model: [consultaInstance: consultaInstance])
                    return
                }
            }
            consultaInstance.properties = params
            if (!consultaInstance.hasErrors() && consultaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'consulta.label', default: 'Consulta'), consultaInstance.id])}"
                redirect(action: "show", id: consultaInstance.id)
            }
            else {
                render(view: "edit", model: [consultaInstance: consultaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def consultaInstance = Consulta.get(params.id)
        if (consultaInstance) {
            try {
                consultaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'consulta.label', default: 'Consulta'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'consulta.label', default: 'Consulta'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'consulta.label', default: 'Consulta'), params.id])}"
            redirect(action: "list")
        }
    }
}
