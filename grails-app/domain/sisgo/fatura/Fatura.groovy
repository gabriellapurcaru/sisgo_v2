package sisgo.fatura

import com.sun.tools.javac.util.ClientCodeException
import sisgo.*
import sisgo.Cliente
import sisgo.PlanoOdontologico

class Fatura {

    static hasMany = [faturasFilhas: FaturaFilha ]


    Cliente cliente
    PlanoOdontologico planoOdontologico

    Date dhc = new Date()
    String nome
    Integer diaDoVencimento
    String formaRepeticao
    Date dataInicio = new Date()
    Date dataTermino
    String descricao
    boolean ativa = true
    String codigo

    static mapping={
        table  'sisgo.faturas'
        version false
        id id: 'id', generator: 'sequence', params: [sequence:'sisgo.faturas_id_seq']
        sort "id"
        order "asc"

    }

    static constraints = {
        dhc()
        nome()
        diaDoVencimento(inList: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31])
        formaRepeticao(inList: ['Mensal'])
        dataInicio()
        dataTermino(nullable: true)
        descricao(nullable: true)
        ativa(nullable: true)
    }
}
