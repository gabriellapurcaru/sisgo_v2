package sisgo

import grails.converters.*

class PlanoTratamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }


    def ajaxGetProcedimentos = {
        def especialidade = Especialidade.get(params.id)
        render especialidade?.procedimentos as JSON
        println  "----------------------------${especialidade.procedimentos}"
    }

    def addPagamento = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        [planoTratamentoInstance:planoTratamentoInstance]

    }

    def savePagamento = {
        def planoTratamentoInstance = PlanoTratamento.get(params.planoTratamento.id as int)


        if (planoTratamentoInstance) {
            planoTratamentoInstance.status= params.status
            println "---- \n\n\n\n\n\n\n${planoTratamentoInstance.status}"
            planoTratamentoInstance.save(failOnError: true)
            flash.message = "Status adicionado com sucesso"
            redirect(action: "list")

        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'inscricoesUTD.label', default: 'InscricoesUTD'), params.id])}"
            redirect(action: "list")
        }
    }


    def list = {
        /*
        * Passado o id do paciente via list, o metodo vai verificar se existe paciente (id), se existir pegue o objeto paciente e
        * liste todos os planos desse paciente (p.plano)--> pegue todos os planos do paciente (planos)
        *
        * */

        def planos
        if (params?.id  &&  !params?.id.equals("")){
            def consulta = Consulta.get(params?.id)
            planos = consulta.planos
        }else{
            planos = PlanoTratamento.list(params)
        }

       def valorTotal = planos.valorProcedimento.sum()
       def valorTotalPago = planos.valorPago?.sum()
       def valorDevendo = valorTotal - valorTotalPago


       params.max = Math.min(params.max ? params.int('max') : 10, 100)
       [planoTratamentoInstanceList: planos,valorTotal:valorTotal, valorTotalPago:valorTotalPago, valorDevendo:valorDevendo]
        // valorTotal:valorTota primeira variavel(modelo) é a variavel passada para a view e a segunda e a que declaramos no metodo.

 }

    def create = {
        def planoTratamentoInstance = new PlanoTratamento()

        planoTratamentoInstance.properties = params
        return [planoTratamentoInstance: planoTratamentoInstance]
    }

    def save = {

        def planoTratamentoInstance = new PlanoTratamento(params)
        def procedimento = Procedimento.get(params.procedimento.id)
        planoTratamentoInstance.valorProcedimento = procedimento.valor
        if (planoTratamentoInstance.save(flush: true)) {

            /*def dente = new Dente()
            dente.nome=params.nome
            dente.face=params.face

            planoTratamento.dente = dente
            planoTratamentoInstance.properties = params

            dente.save()8*/

            flash.message = "${message(code: 'default.created.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), planoTratamentoInstance.id])}"
            redirect(action: "list", id: planoTratamentoInstance.consulta.id)
        }
        else {
            render(view: "create", model: [planoTratamentoInstance: planoTratamentoInstance])
        }
    }

    def show = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        if (!planoTratamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [planoTratamentoInstance: planoTratamentoInstance]
        }
    }

    def edit = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        if (!planoTratamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [planoTratamentoInstance: planoTratamentoInstance]
        }
    }

    def update = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        if (planoTratamentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (planoTratamentoInstance.version > version) {
                    
                    planoTratamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'planoTratamento.label', default: 'PlanoTratamento')] as Object[], "Another user has updated this PlanoTratamento while you were editing")
                    render(view: "edit", model: [planoTratamentoInstance: planoTratamentoInstance])
                    return
                }
            }
            planoTratamentoInstance.properties = params
            if (!planoTratamentoInstance.hasErrors() && planoTratamentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), planoTratamentoInstance.id])}"
                redirect(action: "show", id: planoTratamentoInstance.id)
            }
            else {
                render(view: "edit", model: [planoTratamentoInstance: planoTratamentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        if (planoTratamentoInstance) {
            try {
                planoTratamentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def deletar = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        if (planoTratamentoInstance) {

                planoTratamentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
                redirect(action: "list")

        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def procedimentoRealizado={
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        planoTratamentoInstance.realizado = true
        planoTratamentoInstance.save(flush: true)
        flash.message = "Status de pagamento cadastrado"
        redirect(controller:'planoTratamento',action:'list',id: planoTratamentoInstance.consulta.id)
    }



    def confirmarPagamento={
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        planoTratamentoInstance.pagamentoRealizado = true
        planoTratamentoInstance.save(flush: true)
        flash.message = "Status de pagamento cadastrado"
        redirect(controller:'planoTratamento',action:'list',id: planoTratamentoInstance.consulta.id)
    }

    def addFormaPagamento = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        [planoTratamentoInstance:planoTratamentoInstance]

    }

    def saveFormaPagamento = {
        def planoTratamentoInstance = PlanoTratamento.get(params.planoTratamento.id as int)

        if (planoTratamentoInstance) {
            planoTratamentoInstance.formaPagamento= params.formaPagamento
            planoTratamentoInstance.descricao= params.descricao
            planoTratamentoInstance.valorPago= params.valorPago as BigDecimal
            planoTratamentoInstance.valorProcedimento= params.valorProcedimento as BigDecimal
            planoTratamentoInstance.pagamentoRealizado = true

            planoTratamentoInstance.save(failOnError: true)

            flash.message = "Status adicionado com sucesso"
            redirect(controller:'planoTratamento',action:'list',id: planoTratamentoInstance.consulta.id)

        }
        else {
            flash.message = "Erro"
            redirect(action: "list")
        }
    }

    def addDataRealizacaoProcedimento = {
        def planoTratamentoInstance = PlanoTratamento.get(params.id)
        [planoTratamentoInstance:planoTratamentoInstance]

    }

    def saveDataRealizacaoProcedimento = {
        def planoTratamentoInstance = PlanoTratamento.get(params.planoTratamento.id as int)

        if (planoTratamentoInstance) {
            planoTratamentoInstance.dhr= params.dhr
            planoTratamentoInstance.realizado = true

            planoTratamentoInstance.save(failOnError: true)
            flash.message = "Dados adicionado com sucesso"
            redirect(controller:'planoTratamento',action:'list',id: planoTratamentoInstance.consulta.id)

        }
        else {
            flash.message = "Erro"
            redirect(action: "list")
        }
    }
}
