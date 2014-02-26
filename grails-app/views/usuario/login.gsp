<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Sisgo - Sistema de Gerenciamento Odontológico 2011</title>
		<meta name="layout" content="main" />
    </head>
    <body>
    <div id="content">
        <div id="login-acesso">
            <h1>Efetue seu Login</h1>

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
    </div>
    </body>
</html>