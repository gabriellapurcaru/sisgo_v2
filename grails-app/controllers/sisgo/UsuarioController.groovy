package sisgo

class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-* AUTENTICAÇÃO -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
    def beforeInterceptor = [action:this.&checkAuthorization,except:['login', 'autenticar', 'create', 'save', 'logout']]
    def checkAuthorization(){
  	    def usuarioAutenticado = session.usuarioAutenticado
  	    if(usuarioAutenticado){
  	 	//super.checarAutorizacao(usuarioAutenticado)
  	    }else{
  	    	flash.message = "Por favor, logar no Sistema."
  	    	redirect(controller:'usuario',action:'login')
  	    	}
  	}

    def autenticar = {
        def usuarioSistema = Usuario.findByEmailAndSenha(params['email'],params.senhaAcesso.encodeAsSHA1())
        if (usuarioSistema){
            session.usuarioAutenticado = [email:usuarioSistema?.email, nome:usuarioSistema?.nome, id:usuarioSistema?.id, ativo:usuarioSistema?.ativo]
            session.setMaxInactiveInterval(10000);
            flash.message = "Olá ${usuarioSistema.nome}."
            redirect(controller:'page',action:'admin')
        }else{
            flash.message = "Por favor! Informe Email e senha corretamente."
            redirect(controller:'page',action:'login')
            }
    }

    def login= {}

    def logout={
        if(session.usuarioAutenticado){
            session.invalidate()
            flash.message = "Sessão Encerrada!"
            redirect(controller:'page',action:'login')
        }else{
            redirect(controller:'page',action:'login')
        }
     }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioList: Usuario.list(params), usuarioTotal: Usuario.count()]
    }

    def create = {
        def usuario = new Usuario()
        usuario.properties = params
        return [usuario: usuario]
    }

    def save = {
        def usuario = new Usuario(params)
        usuario.categoria = 'ADMIN'
        if(params.senhaAcesso && !params.senhaAcesso.equals("") && params.senhaConfirmacaoAcesso && !params.senhaConfirmacaoAcesso.equals("") && params.senhaAcesso.equals(params.senhaConfirmacaoAcesso)) {
            if(params?.senhaAcesso?.length() > 5){
                usuario.senha = params.senhaAcesso.encodeAsSHA1()
                if(usuario.save(flush: true)){
                    //abrir SESSÃO para novo usuário entrar no sistema sem ter que fazer login
                    session.usuarioAutenticado = [email:usuario.email, nome:usuario.nome, id:usuario.id, ativo:usuario.ativo]
                    session.setMaxInactiveInterval(10000);

                    flash.message = "Seja Bem Vindo ${usuario.nome}! Seus dados de acesso foram enviados para seu email(${usuario.email})."
                    redirect(controller:'page',action:'admin')
                }else{
                    usuario.senha = ""
                    usuario.senhaConfirmacao = ""
                    flash.message = "Não foi possível cadastrar Usuário."
                    render(view:'create',model:[usuario:usuario])
                }
            }else{
                usuario.senha = ""
                usuario.senhaConfirmacao = ""
                flash.message = "Defina uma senha de 6 ou mais dígitos!"
                render(view:'create',model:[usuario:usuario, params:params])
            }
        }else{
            usuario.senha = ""
            usuario.senhaConfirmacao = ""
            flash.message = "Preencha e confirme a senha corretamente!"
            render(view:'create',model:[usuario:usuario, params:params])
        }
    }

    def show = {
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [usuario: usuario]
        }
    }

    def edit = {
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [usuario: usuario]
        }
    }

    def update = {
        def usuario = Usuario.get(params.id)
        if (usuario) {
            if (params.version) {
                def version = params.version.toLong()
                if (usuario.version > version) {
                    
                    usuario.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'usuario.label', default: 'Usuario')] as Object[], "Another user has updated this Usuario while you were editing")
                    render(view: "edit", model: [usuario: usuario])
                    return
                }
            }
            usuario.properties = params
            if (!usuario.hasErrors() && usuario.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])}"
                redirect(action: "show", id: usuario.id)
            }
            else {
                render(view: "edit", model: [usuario: usuario])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def usuario = Usuario.get(params.id)
        if (usuario) {
            try {
                usuario.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }

    def alterarSenha = {
        def usuarioInstance = Usuario.get(session.usuarioAutenticado.id)
        if (!usuarioInstance) {
            flash.message = "Usuário não encontrado."
            redirect(controller:'usuario',action:'sistema')
        }
        else {
            [usuarioInstance:usuarioInstance]
        }


    }

    def salvarSenha = {
        def usuario = Usuario.get(session?.usuarioAutenticado?.id)
        usuario.properties = params

        if(params?.senhaAcesso){
            if(params?.senhaAcesso?.equals(params?.senhaConfirmacaoAcesso)){
                usuario.senha = params.senhaAcesso.encodeAsSHA1()
                flash.message = "Senha alterada!"
                redirect(controller:'page',action:'admin')
            }else{
                flash.message = "Senha e confimação da senha não são iguais!"
                redirect(controller:'usuario',action:'alterarSenha')
            }
        }else{
            flash.message = "Escolha nova senha!"
            redirect(controller:'usuario',action:'alterarSenha')
        }
    }

}
