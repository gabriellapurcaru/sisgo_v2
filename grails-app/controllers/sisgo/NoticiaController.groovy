package sisgo

class NoticiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [noticiaInstanceList: Noticia.list(params), noticiaInstanceTotal: Noticia.count()]
    }

    def create = {
        def noticiaInstance = new Noticia()
        noticiaInstance.properties = params
        return [noticiaInstance: noticiaInstance]
    }

    def save = {
        def noticiaInstance = new Noticia(params)

        def f = request.getFile('imagem')
        def okcontents = ['image/png', 'image/jpeg', 'image/gif']

        if (!okcontents.contains(f.getContentType())) {
         flash.message = "A imagem deve ser dos tipos: ${okcontents}"
         render(view:'create',model:[noticiaInstance: noticiaInstance])
         return;
        }

        // Salvar a imagem da assinatu e do tipo
        noticiaInstance.imagem= f.getBytes()
        noticiaInstance.imagemTipo = f.getContentType()
        log.info("Imagem uploaded: " + noticiaInstance.imagemTipo)

        if (noticiaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'noticia.label', default: 'Noticia'), noticiaInstance.id])}"
            redirect(action: "show", id: noticiaInstance.id)
        }
        else {
            render(view: "create", model: [noticiaInstance: noticiaInstance])
        }
    }

    def show = {
        def noticiaInstance = Noticia.get(params.id)
        if (!noticiaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [noticiaInstance: noticiaInstance]
        }
    }

    def edit = {
        def noticiaInstance = Noticia.get(params.id)
        if (!noticiaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [noticiaInstance: noticiaInstance]
        }
    }

    def imagem= {
        println "--------------------------------------------- ${params}"
        //def usuario = Usuario.get(session.usuarioAutenticado.id)
        def n = Noticia.get(params.id)
        //def foto = FotoUsuario.findByUsuario(usuario)
        byte[] imagem = n.imagem
        response.outputStream << imagem

    }

    def update = {
        def noticiaInstance = Noticia.get(params.id)
        if (noticiaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (noticiaInstance.version > version) {
                    
                    noticiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'noticia.label', default: 'Noticia')] as Object[], "Another user has updated this Noticia while you were editing")
                    render(view: "edit", model: [noticiaInstance: noticiaInstance])
                    return
                }
            }
            noticiaInstance.properties = params
            if (!noticiaInstance.hasErrors() && noticiaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'noticia.label', default: 'Noticia'), noticiaInstance.id])}"
                redirect(action: "show", id: noticiaInstance.id)
            }
            else {
                render(view: "edit", model: [noticiaInstance: noticiaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def noticiaInstance = Noticia.get(params.id)
        if (noticiaInstance) {
            try {
                noticiaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
    }
}
