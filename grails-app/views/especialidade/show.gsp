
<%@ page import="sisgo.Especialidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'especialidade.label', default: 'Especialidade')}" />
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
                            <td valign="top" class="name">Nome:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: especialidadeInstance, field: "nome")}</td>
                            
                        </tr>

                    </tbody>
                </table>
                <div class="buttons">
                    <g:form>
                        <g:hiddenField name="id" value="${especialidadeInstance?.id}" />
                        <g:actionSubmit class="btn btn-mini" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                        <g:actionSubmit  class="btn btn-mini" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </div>
            </div>

        </div>
    </body>
</html>
