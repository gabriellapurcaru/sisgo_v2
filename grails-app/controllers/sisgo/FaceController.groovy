package sisgo

class FaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [faceInstanceList: Face.list(params), faceInstanceTotal: Face.count()]
    }

    def create = {
        def faceInstance = new Face()
        faceInstance.properties = params
        return [faceInstance: faceInstance]
    }

    def save = {
        def faceInstance = new Face(params)
        if (faceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'face.label', default: 'Face'), faceInstance.id])}"
            redirect(action: "show", id: faceInstance.id)
        }
        else {
            render(view: "create", model: [faceInstance: faceInstance])
        }
    }

    def show = {
        def faceInstance = Face.get(params.id)
        if (!faceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'face.label', default: 'Face'), params.id])}"
            redirect(action: "list")
        }
        else {
            [faceInstance: faceInstance]
        }
    }

    def edit = {
        def faceInstance = Face.get(params.id)
        if (!faceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'face.label', default: 'Face'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [faceInstance: faceInstance]
        }
    }

    def update = {
        def faceInstance = Face.get(params.id)
        if (faceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (faceInstance.version > version) {
                    
                    faceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'face.label', default: 'Face')] as Object[], "Another user has updated this Face while you were editing")
                    render(view: "edit", model: [faceInstance: faceInstance])
                    return
                }
            }
            faceInstance.properties = params
            if (!faceInstance.hasErrors() && faceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'face.label', default: 'Face'), faceInstance.id])}"
                redirect(action: "show", id: faceInstance.id)
            }
            else {
                render(view: "edit", model: [faceInstance: faceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'face.label', default: 'Face'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def faceInstance = Face.get(params.id)
        if (faceInstance) {
            try {
                faceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'face.label', default: 'Face'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'face.label', default: 'Face'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'face.label', default: 'Face'), params.id])}"
            redirect(action: "list")
        }
    }
}
