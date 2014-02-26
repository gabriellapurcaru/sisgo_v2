
<%@ page import="sisgo.Especialidade" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'especialidade.label', default: 'Especialidade')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="form">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="nome" title="${message(code: 'especialidade.nome.label', default: 'Especialidade')}" />
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${especialidadeInstanceList}" status="i" var="especialidadeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean: especialidadeInstance, field: "nome")}</td>
                            <td><g:link action="show" class="btn btn-mini" id="${especialidadeInstance.id}">Visualizar</g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${especialidadeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
