package sisgo

class ClienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clienteInstanceList: Cliente.list(params), clienteInstanceTotal: Cliente.count()]
    }

    def create = {
        def clienteInstance = new Cliente()
        clienteInstance.properties = params
        return [clienteInstance: clienteInstance]
    }

    def save = {
        def clienteInstance = new Cliente(params)
        if (clienteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])}"
            redirect(action: "show", id: clienteInstance.id)
        }
        else {
            render(view: "create", model: [clienteInstance: clienteInstance])
        }
    }

    def show = {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])}"
            redirect(action: "list")
        }
        else {
            [clienteInstance: clienteInstance]
        }
    }

    def edit = {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [clienteInstance: clienteInstance]
        }
    }

    def update = {
        def clienteInstance = Cliente.get(params.id)
        if (clienteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (clienteInstance.version > version) {
                    
                    clienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cliente.label', default: 'Cliente')] as Object[], "Another user has updated this Cliente while you were editing")
                    render(view: "edit", model: [clienteInstance: clienteInstance])
                    return
                }
            }
            clienteInstance.properties = params
            if (!clienteInstance.hasErrors() && clienteInstance.save(flush: true)) {
                flash.message = "Dados atualizados!"
                redirect(action: "show", id: clienteInstance.id)
            }
            else {
                render(view: "edit", model: [clienteInstance: clienteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def clienteInstance = Cliente.get(params.id)
        if (clienteInstance) {
            try {
                clienteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])}"
            redirect(action: "list")
        }
    }

    def deleta = {
        def clienteInstance = Cliente.get(params.id)
        if (clienteInstance) {
            try {
                clienteInstance.delete(flush: true)
                flash.message = "Cliente excluído com sucesso!"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Cliente não pode ser deletado"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "Cliente não encontrado"
            redirect(action: "list")
        }
    }

    def pesquisaGeral = {
        def clientes = Cliente.createCriteria().list() {

            if(params.nome && !params.nome.equals("")){
                like("nome","%${params.nome}%").ignoreCase()
            }

            if(params.dia && !params.dia.equals("")){
                like("dia","%${params.dia}%").ignoreCase()
            }
            if(params.mes && !params.mes.equals("")){
                like("mes","%${params.mes}%").ignoreCase()
            }
            if(params.ano && !params.ano.equals("")){
                like("ano","%${params.ano}%").ignoreCase()
            }


        }
        render(view:'list',model:[clienteInstanceList:clientes, params:params, clienteInstanceTotal: clientes.size()])
    }
}
