
<%@ page import="sisgo.Dente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dente.label', default: 'Dente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <g:sortableColumn property="nome" title="${message(code: 'dente.nome.label', default: 'Nome')}" />
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${denteInstanceList}" status="i" var="denteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: denteInstance, field: "nome")}</td>
                            <td><g:link class="btn btn-mini" action="show" id="${denteInstance.id}">Visualizar</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${denteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
