<html>
<head>
    <title>Erica Gonçalves</title>
    <meta name="layout" content="site" />

</head>
<body>


<div id="content">
    <%if(!session?.usuarioAutenticado){ %>
    <h3>Acessar</h3>
    <div id="login-acesso">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:form  url="[action:'autenticar',controller:'usuario']" method="post">
            <table>
                <tr>
                    <td><span>Email:</span></td>
                    <td><input id="email" type='text' name='email'/></td>
                </tr>
                <tr>
                    <td><span>Senha:</span></td>
                    <td><input id="senha" type='password' name='senhaAcesso' />
                        <input type="submit" value="Entrar"/>
                </tr>
            </table>
        </g:form>
    </div>
    <%}else{ %>

    <div class="botao">
        <a href="${createLink(controller:'paciente',action:'create')}">Cadastrar Paciente</a>
    </div>

    <div class="botao">
        <a href="${createLink(controller:'paciente',action:'list')}">Listar Pacientes</a>
    </div>
    <%}%>

</div>
</body>
</html>
