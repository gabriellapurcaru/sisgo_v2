package sisgo.fatura

import sisgo.fatura.Fatura
import sisgo.*


class FaturaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {

        if (params?.cliente?.id  &&  !params?.cliente?.id.equals("")){
            def c = Cliente.get(params?.cliente.id)
            def fatura = c.fatura

            [faturaInstanceList: fatura,
                    faturaInstanceTotal: fatura.size()]

        }else{
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [faturaInstanceList: Fatura.list(params),
                    faturaInstanceTotal: Fatura.count()]
        }




    }

    def create = {
        def faturaInstance = new Fatura()
        faturaInstance.properties = params
        return [faturaInstance: faturaInstance]
    }

    def save = {


        def y = Fatura.count()
        def a = y +1  as String

        def faturaInstance = new Fatura(params)


        def ano = new Date()
        def b  = ano.year + 1900 as String
        faturaInstance.codigo = b + a

        if (faturaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'fatura.label', default: 'Fatura'), faturaInstance.id])}"
            redirect(action: "show", id: faturaInstance.id)
        }
        else {
            render(view: "create", model: [faturaInstance: faturaInstance])
        }
    }

    def show = {
        def faturaInstance = Fatura.get(params.id)
        if (!faturaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fatura.label', default: 'Fatura'), params.id])}"
            redirect(action: "list")
        }
        else {
            [faturaInstance: faturaInstance]
        }
    }

    def edit = {
        def faturaInstance = Fatura.get(params.id)
        if (!faturaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fatura.label', default: 'Fatura'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [faturaInstance: faturaInstance]
        }
    }

    def update = {
        def faturaInstance = Fatura.get(params.id)
        if (faturaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (faturaInstance.version > version) {
                    
                    faturaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'fatura.label', default: 'Fatura')] as Object[], "Another user has updated this Fatura while you were editing")
                    render(view: "edit", model: [faturaInstance: faturaInstance])
                    return
                }
            }
            faturaInstance.properties = params
            if (!faturaInstance.hasErrors() && faturaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'fatura.label', default: 'Fatura'), faturaInstance.id])}"
                redirect(action: "show", id: faturaInstance.id)
            }
            else {
                render(view: "edit", model: [faturaInstance: faturaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fatura.label', default: 'Fatura'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def faturaInstance = Fatura.get(params.id)
        if (faturaInstance) {
            try {
                faturaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'fatura.label', default: 'Fatura'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'fatura.label', default: 'Fatura'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'fatura.label', default: 'Fatura'), params.id])}"
            redirect(action: "list")
        }
    }

    def resultado = {
        def faturaInstanceList = Fatura.createCriteria().list() {
            createAlias("cliente","cliente")
            and{
                if(params.nome && !params?.nome.equals("")){
                    ilike("cliente.nome","%${params.nome}%")
                }
            }
        }
        render(view:'list',model:[faturaInstanceList:faturaInstanceList, params:params, faturaInstanceTotal: faturaInstanceList.size()])
    }

}
