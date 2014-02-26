package sisgo

class PagamentoPlanoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {

        if (params?.vincularClientePlano?.id  &&  !params?.vincularClientePlano?.id.equals("")){
                       def c = VincularClientePlano.get(params?.vincularClientePlano.id)
                        def pagamentoPlano = c.pagamentoPlano

                        [pagamentoPlanoInstanceList:pagamentoPlano,
                                        pagamentoPlanoInstanceTotal: pagamentoPlano.size()]

                    }else{
                        params.max = Math.min(params.max ? params.int('max') : 10, 100)
                        [pagamentoPlanoInstanceList: PagamentoPlano.list(params),
                                        pagamentoPlanoInstanceTotal: PagamentoPlano.count()]
                    }

    }

    def create = {
        def pagamentoPlanoInstance = new PagamentoPlano()
        pagamentoPlanoInstance.properties = params
        return [pagamentoPlanoInstance: pagamentoPlanoInstance]
    }

    def save = {
        def pagamentoPlanoInstance = new PagamentoPlano(params)
        if (pagamentoPlanoInstance.save(flush: true)) {
            flash.message = "Pagamento Adicionado com Sucesso!"
            redirect(action: "show", id: pagamentoPlanoInstance.id)
        }
        else {
            render(view: "create", model: [pagamentoPlanoInstance: pagamentoPlanoInstance])
        }
    }

    def show = {
        def pagamentoPlanoInstance = PagamentoPlano.get(params.id)
        if (!pagamentoPlanoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoPlano.label', default: 'PagamentoPlano'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pagamentoPlanoInstance: pagamentoPlanoInstance]
        }
    }

    def edit = {
        def pagamentoPlanoInstance = PagamentoPlano.get(params.id)
        if (!pagamentoPlanoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoPlano.label', default: 'PagamentoPlano'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pagamentoPlanoInstance: pagamentoPlanoInstance]
        }
    }

    def update = {
        def pagamentoPlanoInstance = PagamentoPlano.get(params.id)
        if (pagamentoPlanoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pagamentoPlanoInstance.version > version) {
                    
                    pagamentoPlanoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pagamentoPlano.label', default: 'PagamentoPlano')] as Object[], "Another user has updated this PagamentoPlano while you were editing")
                    render(view: "edit", model: [pagamentoPlanoInstance: pagamentoPlanoInstance])
                    return
                }
            }
            pagamentoPlanoInstance.properties = params
            if (!pagamentoPlanoInstance.hasErrors() && pagamentoPlanoInstance.save(flush: true)) {
                flash.message = "Pagamento Atualizado!"
                redirect(action: "show", id: pagamentoPlanoInstance.id)
            }
            else {
                render(view: "edit", model: [pagamentoPlanoInstance: pagamentoPlanoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoPlano.label', default: 'PagamentoPlano'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pagamentoPlanoInstance = PagamentoPlano.get(params.id)
        if (pagamentoPlanoInstance) {
            try {
                pagamentoPlanoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pagamentoPlano.label', default: 'PagamentoPlano'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pagamentoPlano.label', default: 'PagamentoPlano'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pagamentoPlano.label', default: 'PagamentoPlano'), params.id])}"
            redirect(action: "list")
        }
    }

    def resultado = {
        def pagamentos = PagamentoPlano.createCriteria().list() {


            if(params.mes && !params.mes.equals("")){
                like("mes","%${params.mes}%").ignoreCase()
            }
            if(params.dia && !params.dia.equals("")){
                like("dia","%${params.dia}%").ignoreCase()
            }

            if(params.formaPagamento && !params.formaPagamento.equals("")){
                like("formaPagamento","%${params.formaPagamento}%").ignoreCase()
            }

            if(params.status && !params.status.equals("")){
                like("status","%${params.status}%").ignoreCase()
            }
        }

        render(view:'resultado',model:[pagamentos:pagamentos, params:params, pagamentosTotal: pagamentos.size()])
    }


}
