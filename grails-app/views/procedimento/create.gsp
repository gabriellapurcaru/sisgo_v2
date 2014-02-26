

<%@ page import="sisgo.Procedimento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'procedimento.label', default: 'Procedimento')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${procedimentoInstance}">
            <div class="alert alert-block alert-error fade in">
                <g:renderErrors bean="${procedimentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="form">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>

                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="especialidade"><g:message code="procedimento.especialidade.label" default="Especialidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procedimentoInstance, field: 'especialidade', 'errors')}">
                                    <g:select class="selectl" name="especialidade.id" from="${sisgo.Especialidade.list()}" optionKey="id" optionValue="nome" value="${procedimentoInstance?.especialidade?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="procedimento.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procedimentoInstance, field: 'nome', 'errors')}">
                                    <g:textField class="fc2" name="nome" value="${procedimentoInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valor"><g:message code="procedimento.valor.label" default="Valor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: procedimentoInstance, field: 'valor', 'errors')}">
                                    <g:textField class="fc2" name="valor" value="${fieldValue(bean: procedimentoInstance, field: 'valor')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                    <div class="buttons">
                        <span class="button"><g:submitButton name="create"  class="btn btn-mini" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                    </div>
                </div>

            </g:form>
        </div>
    </body>
</html>
