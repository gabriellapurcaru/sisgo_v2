package sisgo

class PlanoOdontologicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [planoOdontologicoInstanceList: PlanoOdontologico.list(params), planoOdontologicoInstanceTotal: PlanoOdontologico.count()]
    }

    def create = {
        def planoOdontologicoInstance = new PlanoOdontologico()
        planoOdontologicoInstance.properties = params
        return [planoOdontologicoInstance: planoOdontologicoInstance]
    }

    def save = {

        def y = PlanoOdontologico.count()
        def a = y +1  as String

        def planoOdontologicoInstance = new PlanoOdontologico(params)


        def ano = new Date()
        def b  = ano.year + 1900 as String
        planoOdontologicoInstance.numeroPlano = b + a


        if (planoOdontologicoInstance.save(flush: true)) {
            flash.message = "Plano cadastrado com sucesso!"
            redirect(action: "show", id: planoOdontologicoInstance.id)
        }
        else {
            render(view: "create", model: [planoOdontologicoInstance: planoOdontologicoInstance])
        }
    }

    def show = {
        def planoOdontologicoInstance = PlanoOdontologico.get(params.id)
        if (!planoOdontologicoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'planoOdontologico.label', default: 'PlanoOdontologico'), params.id])}"
            redirect(action: "list")
        }
        else {
            [planoOdontologicoInstance: planoOdontologicoInstance]
        }
    }

    def edit = {
        def planoOdontologicoInstance = PlanoOdontologico.get(params.id)
        if (!planoOdontologicoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'planoOdontologico.label', default: 'PlanoOdontologico'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [planoOdontologicoInstance: planoOdontologicoInstance]
        }
    }

    def update = {
        def planoOdontologicoInstance = PlanoOdontologico.get(params.id)
        if (planoOdontologicoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (planoOdontologicoInstance.version > version) {
                    
                    planoOdontologicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'planoOdontologico.label', default: 'PlanoOdontologico')] as Object[], "Another user has updated this PlanoOdontologico while you were editing")
                    render(view: "edit", model: [planoOdontologicoInstance: planoOdontologicoInstance])
                    return
                }
            }
            planoOdontologicoInstance.properties = params
            if (!planoOdontologicoInstance.hasErrors() && planoOdontologicoInstance.save(flush: true)) {
                flash.message = "Plano atualizado com sucesso!"
                redirect(action: "show", id: planoOdontologicoInstance.id)
            }
            else {
                render(view: "edit", model: [planoOdontologicoInstance: planoOdontologicoInstance])
            }
        }
        else {
            flash.message = "Erro ao atualizar Plano"
            redirect(action: "list")
        }
    }

    def delete = {
        def planoOdontologicoInstance = PlanoOdontologico.get(params.id)
        if (planoOdontologicoInstance) {
            try {
                planoOdontologicoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'planoOdontologico.label', default: 'PlanoOdontologico'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Plano não pode ser deletado"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "Plano deletado com sucesso!"
            redirect(action: "list")
        }
    }
}
