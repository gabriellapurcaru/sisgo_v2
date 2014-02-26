package sisgo

class Consulta {

    static hasMany = [ planos:PlanoTratamento]

    int id

    Paciente paciente
    Date dataConsulta = new Date()
    String motivo


    static mapping={
        table  'sisgo.consultas'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.consultas_id_seq']
        sort "dataConsulta"
        order "asc"

    }
}
