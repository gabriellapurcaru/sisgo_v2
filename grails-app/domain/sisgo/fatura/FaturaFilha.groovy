package sisgo.fatura

class FaturaFilha {

    static belongsTo = [fatura: Fatura]

    Date dhc = new Date()
    Date dataCriacao
    Date dataVencimento
    Date dataPagamento

    String status = 'Aberta'
    String descricao

    static mapping={
        table  'sisgo.faturas_filhas'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.faturas_filhas_id_seq']
        sort "dataVencimento"
        order "desc"

    }

    static constraints = {
        dhc()
        dataCriacao()
        dataVencimento()
        dataPagamento(nullable: true)
        status(inList: ['Aberta', 'Atrasada', 'Fechada'])
        descricao(nullable: true)
    }
}
