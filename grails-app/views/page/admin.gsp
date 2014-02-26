<html>
    <head>
        <title>Sisgo - Sistema de Gerenciamento Odontológico 2011</title>
        <meta name="layout" content="main" />

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
            <h3>Administrador</h3>


            <div id="box_admin">
                <div class="botao">
                    <a href="${createLink(controller:'paciente',action:'list')}">
                        <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'icon03.png')}" /><br/>Listar <br/>Pacientes
                    </a>
                </div>

            <div class="botao">
                <a href="${createLink(controller:'especialidade',action:'list')}">
                    <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'icon04.png')}" /><br/>Listar<br/>Especialidades
                </a>
            </div>

            <div class="botao">
                <a href="${createLink(controller:'procedimento',action:'list')}">
                    <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'icon04.png')}" /><br/>Listar<br/>Procedimentos
                </a>
            </div>

            <div class="botao">
                <a href="${createLink(controller:'dente',action:'list')}">
                    <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'icon04.png')}" /><br/>Listar<br/>Dentes
                </a>
            </div>
            <div class="botao">
                <a href="${createLink(controller:'conteudo',action:'list')}">
                    <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'icon01.png')}" /><br/>Administrar <br/>Páginas do Site
                </a>
            </div>
            </div>
            <h3>Relatórios</h3>
            <div id="box_admin">
            <div class="botao">
                <a href="${createLink(controller:'paciente',action:'pesquisa')}">
                    <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'icon03.png')}" /><br/>Data <br/>Aniversário
                </a>
            </div>

            <div class="botao">
                <a href="${createLink(controller:'agenda',action:'create')}">
                    <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'icon03.png')}" /><br/>Retornos
                </a>
            </div>
            </div>

            <h3>Planos Odontológicos</h3>
            <div id="box_admin">
                <div class="botao">
                    <a href="${createLink(controller:'planoOdontologico',action:'list')}">
                        <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'plano-odontologico.png')}" /><br/>Planos Odontológicos

                    </a>
                </div>

                <div class="botao">
                    <a href="${createLink(controller:'cliente',action:'list')}">
                        <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'plano-odontologico.png')}" /><br/>Clientes
                    </a>
                </div>

                <div class="botao">
                    <a href="${createLink(controller:'vincularClientePlano',action:'list')}">
                        <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'plano-odontologico.png')}" /><br/>Planos <br/> Contratados
                    </a>
                </div>

                <div class="botao">
                    <a href="${createLink(controller:'fatura',action:'list')}">
                        <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'plano-odontologico.png')}" /><br/>Faturas <br/>
                    </a>
                </div>

                <div class="botao">
                    <a href="${createLink(controller:'pagamentoPlano',action:'resultado')}">
                        <img class="logo" src="${createLinkTo(dir:'images/imgs/',file:'plano-odontologico.png')}" /><br/>Pesquisa <br/> Pagamento Plano
                    </a>
                </div>

            </div>

            <%}%>
        </div>
    </body>
</html>
