package sisgo

class VincularClientePlano {

    static hasMany = [pagamentoPlano: PagamentoPlano ]

    Cliente cliente
    PlanoOdontologico planoOdontologico

    Date dataInclusao = new Date()

    String dia
    String mes

    String periodoContratual
    String status = "ATIVO"

    String codigo



    static constraints = {
        dia(inList: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'])
        mes(inList: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'])
    }

    static mapping = {
        table 'sisgo.vincular_clientes_plano'
        version false
        id id: 'id', generator: 'sequence', params: [sequence:'sisgo.vincular_clientes_plano_id_seq']
        sort "id"
        order "asc"
    }

}
