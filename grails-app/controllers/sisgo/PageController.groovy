package sisgo

import br.com.caelum.stella.validation.*
import grails.plugin.mail.MailService;
import grails.util.GrailsUtil;
import org.apache.commons.mail.HtmlEmail;


class PageController {

    def index = { }

    def inicio = {
        def noticias = Noticia.findAll([max: 3, order: "desc"])

        [noticias:noticias]
    }

    def profissional = {
        def profissionalList = Conteudo.findAllByCategoria("PROFISSIONAL")
        [profissionalList:profissionalList]
    }

    def especialidades = {
        def conteudoInstanceList = Conteudo.findAllByCategoria("ESPECIALIDADE")
        [conteudoInstanceList:conteudoInstanceList]
    }

    def faleComigo = {}

    def mailService
    def enviarContato = {

        def nome = params.nome
        def assunto = params.assunto
        def telefone = params.telefone
        def mensagem = params.mensagem

        mailService.sendMail {
            to "gabriellapurcaru@gmail.com"
            from "gabriellapurcaru@gmail.com"
            subject "Assunto"
            body 'How are you?'
            //body( view:"/page/contato", model:[nome:nome, assunto:assunto, telefone:telefone, mensagem:mensagem])

        }

        redirect(action: "faleComigo")
    }


    def contato = {}


    def credenciamento = {}

    def clinicaGeral = {}

    def endodontia = {}

    def impalntodontia = {}

    def clareamento = {}

    def halitose = {}

    def laserterapia = {}

    def parceiros = {}

    def login = {}

    def admin= {}
}
