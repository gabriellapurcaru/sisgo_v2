
<%@ page import="sisgo.Dente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dente.label', default: 'Dente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Dente Cadastrado</h1>
            <g:if test="${flash.message}">
                <div class="alert fade in">${flash.message}</div>
            </g:if>

            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Dente
                            </td>
                            <td>
                                ${fieldValue(bean: denteInstance, field: "nome")}
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${denteInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn btn-mini" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="btn btn-mini" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
