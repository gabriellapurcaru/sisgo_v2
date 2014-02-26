package sisgo

class ProcedimentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [procedimentoInstanceList: Procedimento.list(params), procedimentoInstanceTotal: Procedimento.count()]
    }

    def create = {
        def procedimentoInstance = new Procedimento()
        procedimentoInstance.properties = params
        return [procedimentoInstance: procedimentoInstance]
    }

    def save = {
        def procedimentoInstance = new Procedimento(params)
        if (procedimentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), procedimentoInstance.id])}"
            redirect(action: "show", id: procedimentoInstance.id)
        }
        else {
            render(view: "create", model: [procedimentoInstance: procedimentoInstance])
        }
    }

    def show = {
        def procedimentoInstance = Procedimento.get(params.id)
        if (!procedimentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [procedimentoInstance: procedimentoInstance]
        }
    }

    def edit = {
        def procedimentoInstance = Procedimento.get(params.id)
        if (!procedimentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [procedimentoInstance: procedimentoInstance]
        }
    }

    def update = {
        def procedimentoInstance = Procedimento.get(params.id)
        if (procedimentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (procedimentoInstance.version > version) {
                    
                    procedimentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'procedimento.label', default: 'Procedimento')] as Object[], "Another user has updated this Procedimento while you were editing")
                    render(view: "edit", model: [procedimentoInstance: procedimentoInstance])
                    return
                }
            }
            procedimentoInstance.properties = params
            if (!procedimentoInstance.hasErrors() && procedimentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), procedimentoInstance.id])}"
                redirect(action: "show", id: procedimentoInstance.id)
            }
            else {
                render(view: "edit", model: [procedimentoInstance: procedimentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
            redirect(action: "list")
        }
    }

    def deleta = {
        def procedimentoInstance = Procedimento.get(params.id)

        if (procedimentoInstance) {
            try {
                procedimentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])} <br> ${procedimentoInstance.getErrors()}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
            redirect(action: "list")
        }


    }


    def delete = {
        def procedimentoInstance = Procedimento.get(params.id)
        if (procedimentoInstance) {
            try {
                procedimentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'procedimento.label', default: 'Procedimento'), params.id])}"
            redirect(action: "list")
        }
    }

    def resultado = {
        def procedimentoInstanceList = Procedimento.createCriteria().list() {
            if(params.nome && !params.nome.equals("")){
                like("nome","%${params.nome}%").ignoreCase()
            }

        }

        render(view:'list',model:[procedimentoInstanceList:procedimentoInstanceList, params:params, procedimentoInstanceTotal: procedimentoInstanceList.size()])
    }


}
