
<%@ page import="sisgo.Procedimento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'procedimento.label', default: 'Procedimento')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="form">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>

                <table class="table table-bordered">
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="procedimento.especialidade.label" default="Especialidade" /></td>
                            
                            <td valign="top" class="value">${procedimentoInstance?.especialidade?.nome}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="procedimento.nome.label" default="Procedimento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: procedimentoInstance, field: "nome")}</td>
                            
                        </tr>
                    

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="procedimento.valor.label" default="Valor" /></td>
                            
                            <td valign="top" class="value">R$${fieldValue(bean: procedimentoInstance, field: "valor")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
                <div class="buttons">
                    <g:form>
                        <g:hiddenField name="id" value="${procedimentoInstance?.id}" />
                        <span class="button"><g:actionSubmit class="btn btn-mini" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                        <span class="button"><g:actionSubmit class="btn btn-mini" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:form>
                </div>
            </div>

        </div>
    </body>
</html>
