package sisgo

class Clinica {
    static hasMany = [pacientes:Paciente]
    String name

    static mapping = {
        sort 'name'
    }

    static constraints = {
        name(blank: false, maxSize: 50, unique: true)
    }

    String toString() {
        name
    }

}
