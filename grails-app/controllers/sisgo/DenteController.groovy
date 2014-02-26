package sisgo

class DenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [denteInstanceList: Dente.list(params), denteInstanceTotal: Dente.count()]
    }

    def create = {
        def denteInstance = new Dente()
        denteInstance.properties = params
        return [denteInstance: denteInstance]
    }

    def save = {
        def denteInstance = new Dente(params)
        if (denteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dente.label', default: 'Dente'), denteInstance.id])}"
            redirect(action: "show", id: denteInstance.id)
        }
        else {
            render(view: "create", model: [denteInstance: denteInstance])
        }
    }

    def show = {
        def denteInstance = Dente.get(params.id)
        if (!denteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dente.label', default: 'Dente'), params.id])}"
            redirect(action: "list")
        }
        else {
            [denteInstance: denteInstance]
        }
    }

    def edit = {
        def denteInstance = Dente.get(params.id)
        if (!denteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dente.label', default: 'Dente'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [denteInstance: denteInstance]
        }
    }

    def update = {
        def denteInstance = Dente.get(params.id)
        if (denteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (denteInstance.version > version) {
                    
                    denteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dente.label', default: 'Dente')] as Object[], "Another user has updated this Dente while you were editing")
                    render(view: "edit", model: [denteInstance: denteInstance])
                    return
                }
            }
            denteInstance.properties = params
            if (!denteInstance.hasErrors() && denteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dente.label', default: 'Dente'), denteInstance.id])}"
                redirect(action: "show", id: denteInstance.id)
            }
            else {
                render(view: "edit", model: [denteInstance: denteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dente.label', default: 'Dente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def denteInstance = Dente.get(params.id)
        if (denteInstance) {
            try {
                denteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dente.label', default: 'Dente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dente.label', default: 'Dente'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dente.label', default: 'Dente'), params.id])}"
            redirect(action: "list")
        }
    }
}
