<%@ page import="sisgo.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title>Erica Gonçalves</title>
    </head>
    <body>

    <div class="form">
            <h3>Alterar Senha</h3>

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${usuario}">
            <div class="errors">
                <g:renderErrors bean="${usuario}" as="list" />
            </div>
            </g:hasErrors>

            <g:form action="salvarSenha" method="post" >
                <input type="hidden" name="id" value="${usuario?.id}" />

                <div class="controls">
                    <label for="nome"><g:message code="paciente.nome.label" default="Nome" /></label>
                    <input type="text" class="span3" readonly="readonly" value="${usuarioInstance?.nome}" size="65"/>
                </div>

                <div class="controls">
                    <label for="email"><g:message code="paciente.email.label" default="Email" /></label>
                    <input type="text" class="span3"  readonly="readonly" value="${usuarioInstance?.email}" size="65"/>
                </div>


                <div class="controls">
                    <label for="senhaAcesso"><g:message code="paciente.senha.label" default="Nova Senha" /></label>
                    <input type="password" class="span3" name="senhaAcesso" id="senhaAcesso"  size="20" autocomplete="off"/>
                </div>


                <div class="controls">
                    <label for="senhaConfirmacaoAcesso"><g:message code="paciente.email.label" default="Confirmar Nova Senha" /></label>
                    <input type="password" class="span3" name="senhaConfirmacaoAcesso" id="senhaConfirmacaoAcesso" size="20" autocomplete="off"/>
                </div>

                <div class="buttons">
                    <span class="button"><input class="btn" type="submit" value="Salvar Senha" /></span>
                </div>

            </g:form>
        </div>
    </body>
</html>
