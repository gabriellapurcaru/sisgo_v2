

<%@ page import="sisgo.PlanoOdontologico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'planoOdontologico.label', default: 'PlanoOdontologico')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="form">
            <h1>Cadastrar Plano Odontológico</h1>
            <g:if test="${flash.message}">
            <div class="alert alert-block">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${planoOdontologicoInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${planoOdontologicoInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:form action="save" >

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
                        <g:select class="span3" name="tipoPlano" id="tipoPlano" from="${['MENSAL','BÁSICO', 'VIP']}" value="${fieldValue(bean:planoOdontologico,field:'planoOdontologicoInstance')}" noSelection="['':'-Selecione uma opção -']"/>
                    </p>

                </div>



                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="btn" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
