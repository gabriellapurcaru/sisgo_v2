package sisgo

class Conteudo {

    int id
    //byte[] imagem
    //String imagemTipo
    int imagemId
    String titulo
    String texto
    String categoria
    int faqEspId

    Date criadaEm = new Date()
    Date publicadaEm = new Date()

    static mapping={
        table  'sisgo.conteudo'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.conteudo_id_seq']
        sort "criadaEm"
        order "desc"

    }

    static constraints = {
        titulo (blank: false, maxSize: 255)
        texto (blank: false)
        categoria (blank: false, maxSize: 100)
    }
}
