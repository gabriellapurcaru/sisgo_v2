package sisgo


import br.com.caelum.stella.validation.*
import grails.plugin.mail.MailService;
import grails.util.GrailsUtil;
import org.apache.commons.mail.HtmlEmail;

class ConteudoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-* AUTENTICAÇÃO -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
    def beforeInterceptor = [action:this.&checkAuthorization,except:['login', 'autenticar', 'imagem', 'listagem', 'exibir']]
    def checkAuthorization(){
  	    def usuarioAutenticado = session.usuarioAutenticado
  	    if(usuarioAutenticado){
  	 	//super.checarAutorizacao(usuarioAutenticado)
  	    }else{
  	    	flash.message = "Por favor, logar no Sistema."
  	    	redirect(controller:'page',action:'login')
  	    	}
  	}

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [conteudoInstanceList: Conteudo.list(params), conteudoInstanceTotal: Conteudo.count()]
    }

    def listagem = {

        def noticiaList = Conteudo.findAllByCategoria("CURIOSIDADE")
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [conteudoInstanceList: Conteudo.list(params), conteudoInstanceTotal: Conteudo.count(), noticiaList:noticiaList]
    }

    def addImagem = {}

    def create = {
        def conteudoInstance = new Conteudo()
        conteudoInstance.properties = params

        if (params.especialidade){
            conteudoInstance.categoria="FAQ"
            conteudoInstance.faqEspId=params.especialidade as int
        }

        if(params.ufileId){
            flash.message = "Imagem adicionado no banco."
            redirect(controller: "conteudo" , action: "list")
        }else{
            return [conteudoInstance: conteudoInstance]
        }

        return [conteudoInstance: conteudoInstance]
    }

    def save = {

        def conteudoInstance = new Conteudo(params)
        //if (params.especialidade){
          //  conteudoInstance.categoria="FAQ"
            //conteudoInstance.faqEspId=params.especialidade as int
        //}

       /* def f = request.getFile('imagem')
        def okcontents = ['image/png', 'image/jpeg', 'image/gif']

        if (!okcontents.contains(f.getContentType())) {
            flash.message = "A imagem deve ser dos tipos: ${okcontents}"
            render(view:'create',model:[conteudoInstance: conteudoInstance])
            return;
        }

        // Salvar a imagem da assinatu e do tipo
        conteudoInstance.imagem= f.getBytes()
        conteudoInstance.imagemTipo = f.getContentType()
        log.info("Imagem uploaded: " + conteudoInstance.imagemTipo)

         */
        if (conteudoInstance.save(flush: true)) {
            flash.message = "Página Cadastrada com Sucesso"
            redirect(action: "list")
        }
        else {
            render(view: "create", model: [conteudoInstance: conteudoInstance])
        }
    }

    /*def imagem= {
        println "--------------------------------------------- ${params}"
        //def usuario = Usuario.get(session.usuarioAutenticado.id)
        def n = Conteudo.get(params.id)
        //def foto = FotoUsuario.findByUsuario(usuario)
        byte[] imagem = n.imagem
        response.outputStream << imagem

    } */

    def show = {
        def conteudoInstance = Conteudo.get(params.id)
        if (!conteudoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conteudo.label', default: 'Conteudo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [conteudoInstance: conteudoInstance]
        }
    }

    def exibir = {

        def conteudoInstance = Conteudo.findByTitulo(params.titulo)
        if (!conteudoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conteudo.label', default: 'Conteudo'), params.id])}"
            redirect(action: "list")
        }
        else {
            def noticiaList = Conteudo.findAllByCategoria("ESPECIALIDADE")
            [conteudoInstance: conteudoInstance,noticiaList:noticiaList]
        }
    }

    def edit = {
        def conteudoInstance = Conteudo.get(params.id)
        if (!conteudoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conteudo.label', default: 'Conteudo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [conteudoInstance: conteudoInstance]
        }
    }

    def update = {
        def conteudoInstance = Conteudo.get(params.id)
        if (conteudoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (conteudoInstance.version > version) {
                    
                    conteudoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'conteudo.label', default: 'Conteudo')] as Object[], "Another user has updated this Conteudo while you were editing")
                    render(view: "edit", model: [conteudoInstance: conteudoInstance])
                    return
                }
            }
            conteudoInstance.properties = params
            if (!conteudoInstance.hasErrors() && conteudoInstance.save(flush: true)) {
                flash.message = "Conteúdo Atualizado com Sucesso!"
                redirect(action: "show", id: conteudoInstance.id)
            }
            else {
                render(view: "edit", model: [conteudoInstance: conteudoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'conteudo.label', default: 'Conteudo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def conteudoInstance = Conteudo.get(params.id)
        if (conteudoInstance) {
            try {
                conteudoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'conteudo.label', default: 'Conteudo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'conteudo.label', default: 'Conteudo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "Conteúdo Deletado com Sucesso"
            redirect(action: "list")
        }
    }

    def removerImagem = {
        def conteudoInstance = Conteudo.get(params.id)
        conteudoInstance.imagemId = ''

        render(view: "edit", model: [conteudoInstance: conteudoInstance])
    }



}
