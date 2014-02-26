package sisgo

class PlanoOdontologico {

    static hasMany = [vincularCliente: VincularClientePlano ]

    int id
    String nome
    String valorPlano
    String tipoPlano
    Date dhc = new Date()
    String numeroPlano
    //boolean ativo

    static constraints = {
        nome(blank:false, nullable: false)
        valorPlano(blank:true, nullable: true)
        tipoPlano(blank:true, nullable: true)
        ativo(blank:true, nullable: true)

    }

    static mapping = {
        table 'sisgo.plano_odontologico'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.plano_odontologico_id_seq']
        sort "dhc"
        order "asc"
    }

    String toString() { return "${nome}" }
}
