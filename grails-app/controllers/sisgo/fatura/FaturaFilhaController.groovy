package sisgo.fatura
import sisgo.fatura.FaturaFilha

class FaturaFilhaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {


        if (params?.fatura?.id  &&  !params?.fatura?.id.equals("")){
            def c = Fatura.get(params?.fatura?.id)
            def faturaFilha = c.faturasFilhas

            [faturaFilhaInstanceList: faturaFilha,
                            faturaFilhaInstanceTotal: faturaFilha.size()]

        }else{
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [faturaFilhaInstanceList: FaturaFilha.list(params),
                           faturaFilhaInstanceTotal: FaturaFilha.count()]
        }




    }

    def pesquisa = {

        def faturaFilhaInstance = FaturaFilha.createCriteria().list() {
            if(params.status && !params.status.equals("")){
                eq("status","${params.status}")
            }

        }

        def hoje = new Date()

        if(params.dia && params.dia?.length() == 10){
            def x = params.dia.split(['-'])
            def d = "${x[1]}/${x[0]}/${x[2]}"
            def dia = new Date(d)
            def resultados = FaturaFilha.withCriteria {
                between('dataVencimento', dia, dia+1)
            }
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [faturaFilhaInstanceList: resultados, faturaFilhaInstanceTotal: resultados.size(),hoje:hoje]
        }else if(params.mes && params.mes?.length() == 7){
            def y = params.mes.split(['-'])
            // primeiro dia do mes da pesquisa: mes1
            def p = "${y[0]}/01/${y[1]}"
            def mes = new Date(p)
            def mes1 = "${mes.month + 1}/01/${mes.year + 1900}"
            // primeiro dia do mes seguinte
            def mes2 = "${mes.month + 2}/01/${mes.year + 1900}"
            def m1 = new Date(mes1)
            def m2 = new Date(mes2)
            def resultados = FaturaFilha.withCriteria {
                between('dataVencimento', m1, m2)
            }
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [faturaFilhaInstanceList: resultados, faturaFilhaInstanceTotal: resultados.size(), hoje: hoje]

        }

        render(view:'pesquisa',model:[faturaFilhaInstanceList: faturaFilhaInstance, params:params, faturaFilhaInstanceTotal: faturaFilhaInstance.size()])


    }



    def create = {
        def faturaFilhaInstance = new FaturaFilha()
        faturaFilhaInstance.properties = params
        return [faturaFilhaInstance: faturaFilhaInstance]
    }

    def save = {
        def faturaFilhaInstance = new FaturaFilha(params)
        if (faturaFilhaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha'), faturaFilhaInstance.id])}"
            redirect(action: "show", id: faturaFilhaInstance.id)
        }
        else {
            render(view: "create", model: [faturaFilhaInstance: faturaFilhaInstance])
        }
    }

    def show = {
        def faturaFilhaInstance = FaturaFilha.get(params.id)
        if (!faturaFilhaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha'), params.id])}"
            redirect(action: "list")
        }
        else {
            [faturaFilhaInstance: faturaFilhaInstance]
        }
    }

    def edit = {
        def faturaFilhaInstance = FaturaFilha.get(params.id)
        if (!faturaFilhaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [faturaFilhaInstance: faturaFilhaInstance]
        }
    }

    def update = {
        def faturaFilhaInstance = FaturaFilha.get(params.id)
        if (faturaFilhaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (faturaFilhaInstance.version > version) {
                    
                    faturaFilhaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'faturaFilha.label', default: 'FaturaFilha')] as Object[], "Another user has updated this FaturaFilha while you were editing")
                    render(view: "edit", model: [faturaFilhaInstance: faturaFilhaInstance])
                    return
                }
            }
            faturaFilhaInstance.properties = params
            if (!faturaFilhaInstance.hasErrors() && faturaFilhaInstance.save(flush: true)) {
                flash.message = "Pagamento Adicionado"
                redirect(controlle:"fatura", action: "list", id: faturaFilhaInstance.id)
            }
            else {
                render(view: "edit", model: [faturaFilhaInstance: faturaFilhaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def faturaFilhaInstance = FaturaFilha.get(params.id)
        if (faturaFilhaInstance) {
            try {
                faturaFilhaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha'), params.id])}"
            redirect(action: "list")
        }
    }
}
