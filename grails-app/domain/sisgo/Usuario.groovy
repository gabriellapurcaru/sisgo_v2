package sisgo

class Usuario {

    int id
    String nome
    String email
    String senha
    String senhaConfirmacao
    String categoria

    Boolean ativo = false

    static mapping={
        table  'sisgo.usuarios'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.usuarios_id_seq']
        sort "nome"
        order "asc"
  	}

    static constraints = {
        nome(blank: false, nullable: true, maxSize: 70, unique: true)
        email(blank:false, email:true, unique:true, size:0..75)
        senha(blank: false, nullable: false, minSize:6, password: true)
        ativo(blank: false)
    }

    static transients = ['senhaConfirmacao']

    String toString() { return "${id}: ${nome}" }
}
