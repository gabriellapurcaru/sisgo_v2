

<%@ page import="sisgo.Especialidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'especialidade.label', default: 'Especialidade')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${especialidadeInstance}">
            <div class="alert alert-block alert-error fade in">
                <g:renderErrors bean="${especialidadeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="form">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>

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
                       <g:submitButton name="create" class="btn btn-mini" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>

                </div>
            </g:form>
        </div>
    </body>
</html>
