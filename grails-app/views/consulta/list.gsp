
<%@ page import="sisgo.Consulta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

    <div class="body">
            <h1>Listagem de Consultas</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <g:sortableColumn property="dataConsulta" title="${message(code: 'consulta.dataConsulta.label', default: 'Data Consulta')}" />
                            <th><g:message code="consulta.paciente.label" default="Motivo" /></th>
                            <th><g:message code="consulta.paciente.label" default="Paciente" /></th>
                            <g:sortableColumn property="id" title="Ações" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${consultaInstanceList}" status="i" var="consultaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td> <g:formatDate format="dd-MM-yyyy" date="${consultaInstance?.dataConsulta}"/></td>
                            <td>${consultaInstance.motivo}</td>
                            <td>${consultaInstance.paciente.nome}</td>
                            <td><g:link class="btn btn-mini" controller="planoTratamento" action="list" id="${consultaInstance.id}">Visualizar</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${consultaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
