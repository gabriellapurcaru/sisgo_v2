

<%@ page import="sisgo.Especialidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'especialidade.label', default: 'Especialidade')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${especialidadeInstance}">
            <div class="errors">
                <g:renderErrors bean="${especialidadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${especialidadeInstance?.id}" />
                <g:hiddenField name="version" value="${especialidadeInstance?.version}" />
                <div class="form">
                    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>

                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="especialidade.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: especialidadeInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${especialidadeInstance?.nome}" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <div class="buttons">
                       <g:actionSubmit  class="btn btn-mini" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                       <g:actionSubmit  class="btn btn-mini" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </div>
                </div>

            </g:form>
        </div>
    </body>
</html>
