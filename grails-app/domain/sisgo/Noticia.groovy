package sisgo

class Noticia {

    static searchable = true
    
    int id
    byte[] imagem
    String imagemTipo
    String titulo
    String texto
    String resumo
    Date criadaEm = new Date()
    Date publicadaEm = new Date()

    static constraints = {
    }

    static mapping={
        table  'sisgo.noticias'
        version false
        id name: 'id', generator: 'sequence', params: [sequence:'sisgo.noticias_id_seq']
        sort "criadaEm"
        order "desc"

    }
}
