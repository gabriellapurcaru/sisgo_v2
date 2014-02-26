package sisgo

class PlanoTratamento {

    long id
    Date dhc = new Date()

    String descricao
    String formaPagamento
    float valorPago
    float valorProcedimento
    Date dhr = new Date()

    boolean realizado = false

    String anotacao

    boolean pagamentoRealizado = false

    boolean status = false

    boolean face1 = false
    boolean face2 = false
    boolean face3 = false
    boolean face4 = false


    boolean face5 = false
    Procedimento procedimento
    Dente dente
    Consulta consulta

    static constraints = {
        descricao(blank:true,nullable: true)
        formaPagamento(blank:true,nullable: true)
        valorPago(blank:true,nullable: true)
        valorProcedimento(blank:true,nullable: true)
        anotacao(blank:true,nullable: true)
        dhr(blank:true,nullable: true)

    }

    static mapping={
        table 'sisgo.plano_tratamento'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.plano_tratamento_id_seq']
        sort "dhc"
        order "asc"
    }
}
