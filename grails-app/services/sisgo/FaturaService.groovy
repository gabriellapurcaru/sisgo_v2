package sisgo
import sisgo.fatura.FaturaFilha

class FaturaService {

    static transactional = true

    // def mailService
    def date = new Date()
    // fatura com 10 dias de antecedência
    def date10 = new Date() + 10

    def geraFaturas(){
        def faturas = sisgo.fatura.Fatura.findAllByDiaDoVencimento(date10.getDate())
        faturas.each{fatura ->
            fatura.addToFaturasFilhas(new FaturaFilha(dataCriacao: new Date(), dataVencimento: date10)).save()
        }
    }

    def faturasAtrasadas(){
        def faturasFilhas = FaturaFilha.findAllByDataVencimentoLessThanAndStatus(date, 'Aberta')
        faturasFilhas.each{faturaFilha ->
            faturaFilha.status = 'Atrasada'
            faturaFilha.save()
            println "\n\n\n\n execute fatura atrasada \n\n\n\n "
        }
    }
}
