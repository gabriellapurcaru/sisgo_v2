
<%@ page import="sisgo.Conteudo" %>
<html>
<head>
    <title>Erica Gonçalves</title>
    <meta name="layout" content="pag" />

</head>
<body>

<div id="conteudo" class="bdy">
    <div id="box-topo">
        <h2 style="margin: 45px 20px 5px 0px;width: 200px;float:left;">login</h2>
        <div class="logo">
            <a href="${createLink(uri: '/page/inicio')}"><img src="${resource(dir:'images/imgs',file:'logo02.png')}" /></a>
        </div>
    </div>
    <div id="box-conteudo-meio">
         <span>
                <%if(!session?.usuarioAutenticado){ %>
                <h3>Acessar</h3>
                <g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
                </g:if>

                <div id="login-acesso">
                        <g:form  url="[action:'autenticar',controller:'usuario']" method="post">
                            <table>
                                <tr>
                                    <td><input placeholder="email" class="form" id="email" type='text' name='email'/></td>
                                </tr>
                                <tr>
                                    <td><input placeholder="senha" class="form" id="senha" type='password' name='senhaAcesso' />
                                </tr>
                                <tr>
                                    <td><input class="ok" type="submit" value="Entrar"/></td>
                                </tr>
                               </table>
                           </g:form>
                       </div>
                <%}else{ %>
                    <p class="auth">Seja bem vindo(a): <img src="${createLinkTo(dir:'images/i/',file:'user.png')}" style="vertical-align: middle;"/> ${session?.usuarioAutenticado?.nome}  |  <a class="e1" href="${createLink(controller:'usuario',action:'logout')}"> Sair</a></p>
                        <div class="botao"><a class="e1" href="${createLink(controller:'page',action:'admin')}"> Ir para sistema</a></div>
                        <div class="botao"><a class="e1" href="${createLink(controller:'usuario',action:'alterarSenha')}">Mudar Senha</a></div>
                <%}%>

        </span>
    </div>
</div>
    </body>
</html>
