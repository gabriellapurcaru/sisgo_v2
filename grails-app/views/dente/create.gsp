

<%@ page import="sisgo.Dente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dente.label', default: 'Dente')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${denteInstance}">
            <div class="alert alert-block alert-error fade in">
                <g:renderErrors bean="${denteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="form">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>


                    <table>
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="nome"><g:message code="dente.nome.label" default="Nome" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: denteInstance, field: 'nome', 'errors')}">
                                <g:textField  class="fc1" name="nome" maxlength="180" value="${denteInstance?.nome}"/>

                            </td>
                        </tr>

                        </tbody>
                    </table>
                    <div class="buttons">
                       <g:submitButton name="create"  class="btn btn-mini" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </div>
                </div>

            </g:form>
        </div>
    </body>
</html>
