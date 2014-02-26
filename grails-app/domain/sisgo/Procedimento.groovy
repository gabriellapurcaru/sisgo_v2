package sisgo

class Procedimento {

    long id
    String nome
    float valor
    Date dhc = new Date()

    static belongsTo = [especialidade:Especialidade]

    static hasMany = [planosTratamento:PlanoTratamento]

    static constraints = {
    }

    static mapping={
        table 'sisgo.procedimentos'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.procedimentos_id_seq']
        sort "nome"
        order "asc"
    }

    String toString() { return "${nome}" }
}
