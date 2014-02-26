

<%@ page import="sisgo.PlanoOdontologico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'planoOdontologico.label', default: 'PlanoOdontologico')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav">
        <span class="menuButton"><g:link class="btn btn-primary" action="list">Listagem Planos Odontológicos</g:link></span>
    </div>
        <div class="body">
            <h1>Atualizar Plano Odontológico</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${planoOdontologicoInstance}">
            <div class="errors">
                <g:renderErrors bean="${planoOdontologicoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${planoOdontologicoInstance?.id}" />
                <g:hiddenField name="version" value="${planoOdontologicoInstance?.version}" />
                <div class="dialog">
                    <div class="controls controls-row">
                        <p class="fc2">
                            <label for="nome"><g:message code="planoOdontologico.nome.label" default="Nome" /></label>
                            <g:textField name="nome" class="span3" value="${planoOdontologicoInstance?.nome}" />
                        </p>

                    </div>

                    <div class="controls controls-row">
                        <p class="fc2">
                            <label for="valorPlano"><g:message code="planoOdontologico.valorPlano.label" default="Valor Plano" /></label>
                            <g:textField name="valorPlano" class="span3" value="${planoOdontologicoInstance?.valorPlano}" />
                        </p>

                    </div>

                    <div class="controls controls-row">
                        <p class="fc2">
                            <label for="tipoPlano"><g:message code="planoOdontologico.tipoPlano.label" default="Tipo Plano" /></label>
                            <g:select class="span3" name="tipoPlano" id="tipoPlano" from="${['MENSAL','BÁSICO', 'VIP']}" value="${fieldValue(bean:planoOdontologico,field:'planoOdontologicoInstance')}"/>
                        </p>

                    </div>

                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="btn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
