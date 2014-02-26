package sisgo

class VincularClientePlanoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        if (params?.cliente?.id  &&  !params?.cliente?.id.equals("")){
            def c = Cliente.get(params?.cliente.id)
            def vincularCliente = c.vincularCliente

            [vincularClientePlanoInstanceList:vincularCliente,
                    vincularClientePlanoInstanceTotal: vincularCliente.size()]

        }else{
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [vincularClientePlanoInstanceList: VincularClientePlano.list(params),
                    vincularClientePlanoInstanceTotal: VincularClientePlano.count()]
        }
    }
    def create = {
        def vincularClientePlanoInstance = new VincularClientePlano()
        vincularClientePlanoInstance.properties = params
        return [vincularClientePlanoInstance: vincularClientePlanoInstance]
    }

    def save = {

        def y = VincularClientePlano.count()
        def a = y +1  as String

        def vincularClientePlanoInstance = new VincularClientePlano(params)


        def ano = new Date()
        def b  = ano.year + 1900 as String
        vincularClientePlanoInstance.codigo = b + a



        if (vincularClientePlanoInstance.save(flush: true)) {
            flash.message = "Cliente vinculado com sucesso!"
            redirect(action: "show", id: vincularClientePlanoInstance.id)
        }
        else {
            render(view: "create", model: [vincularClientePlanoInstance: vincularClientePlanoInstance])
        }
    }

    def show = {
        def vincularClientePlanoInstance = VincularClientePlano.get(params.id)
        if (!vincularClientePlanoInstance) {
            flash.message = "Cliente vinculado com sucesso!"
            redirect(action: "list")
        }
        else {
            [vincularClientePlanoInstance: vincularClientePlanoInstance]
        }
    }

    def edit = {
        def vincularClientePlanoInstance = VincularClientePlano.get(params.id)
        if (!vincularClientePlanoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vincularClientePlano.label', default: 'VincularClientePlano'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [vincularClientePlanoInstance: vincularClientePlanoInstance]
        }
    }

    def update = {
        def vincularClientePlanoInstance = VincularClientePlano.get(params.id)
        if (vincularClientePlanoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vincularClientePlanoInstance.version > version) {
                    
                    vincularClientePlanoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'vincularClientePlano.label', default: 'VincularClientePlano')] as Object[], "Another user has updated this VincularClientePlano while you were editing")
                    render(view: "edit", model: [vincularClientePlanoInstance: vincularClientePlanoInstance])
                    return
                }
            }
            vincularClientePlanoInstance.properties = params
            if (!vincularClientePlanoInstance.hasErrors() && vincularClientePlanoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'vincularClientePlano.label', default: 'VincularClientePlano'), vincularClientePlanoInstance.id])}"
                redirect(action: "show", id: vincularClientePlanoInstance.id)
            }
            else {
                render(view: "edit", model: [vincularClientePlanoInstance: vincularClientePlanoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vincularClientePlano.label', default: 'VincularClientePlano'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def vincularClientePlanoInstance = VincularClientePlano.get(params.id)
        if (vincularClientePlanoInstance) {
            try {
                vincularClientePlanoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'vincularClientePlano.label', default: 'VincularClientePlano'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'vincularClientePlano.label', default: 'VincularClientePlano'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vincularClientePlano.label', default: 'VincularClientePlano'), params.id])}"
            redirect(action: "list")
        }
    }



    def resultado = {
        def vincularClientePlanoInstanceList = VincularClientePlano.createCriteria().list() {

                //cliente{
                //    like("nome,"%${params.nome}%")
                //}

                createAlias("cliente","cliente")

                and{
                    if(params.nome && !params?.nome.equals("")){
                        ilike("cliente.nome","%${params.nome}%")

                    }
                }

        }

        render(view:'list',model:[vincularClientePlanoInstanceList:vincularClientePlanoInstanceList, params:params, vincularClientePlanoInstanceTotal: vincularClientePlanoInstanceList.size()])
    }
}
