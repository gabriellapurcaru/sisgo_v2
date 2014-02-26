package sisgo

class Dente {

    long id
    String nome
    Date dhc = new Date()

    static hasMany = [planosTratamento:PlanoTratamento]

    static constraints = {
    }

    static mapping={
        table 'sisgo.dente'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.dente_id_seq']
        sort "nome"
        order "asc"
    }

    String toString() { return "${nome}" }
}
