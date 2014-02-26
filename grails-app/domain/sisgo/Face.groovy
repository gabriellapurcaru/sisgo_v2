package sisgo

class Face {
    int id
    String face

    static hasMany = [planosTratamento:PlanoTratamento]

    static constraints = {
    }
}
