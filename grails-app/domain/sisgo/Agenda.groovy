package sisgo

class Agenda {

    Paciente paciente

    Date dataRetorno = new Date()
    String retorno


    static constraints = {
    }


    static mapping={
        table  'sisgo.agenda'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.agenda_id_seq']
    }
}
