package sisgo

class Especialidade {

    long id
    String nome
    Date dhc = new Date()

    static hasMany = [procedimentos:Procedimento]

    static constraints = {
    }

    static mapping={
        table 'sisgo.especialidades'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.especialidades_id_seq']
        sort "nome"
        order "asc"
    }

    String toString() { return "${nome}" }

}
