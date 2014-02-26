
<%@ page import="sisgo.Anamnese" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anamnese.label', default: 'Anamnese')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'anamnese.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="motivoConsulta" title="${message(code: 'anamnese.motivoConsulta.label', default: 'Motivo Consulta')}" />
                        
                            <g:sortableColumn property="ultimaVisita" title="${message(code: 'anamnese.ultimaVisita.label', default: 'Ultima Visita')}" />
                        
                            <g:sortableColumn property="alergia" title="${message(code: 'anamnese.alergia.label', default: 'Alergia')}" />
                        
                            <g:sortableColumn property="anemia" title="${message(code: 'anamnese.anemia.label', default: 'Anemia')}" />
                        
                            <g:sortableColumn property="anestesia" title="${message(code: 'anamnese.anestesia.label', default: 'Anestesia')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${anamneseInstanceList}" status="i" var="anamneseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${anamneseInstance.id}">${fieldValue(bean: anamneseInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: anamneseInstance, field: "motivoConsulta")}</td>
                        
                            <td><g:formatDate date="${anamneseInstance.ultimaVisita}" /></td>
                        
                            <td><g:formatBoolean boolean="${anamneseInstance.alergia}" /></td>
                        
                            <td><g:formatBoolean boolean="${anamneseInstance.anemia}" /></td>
                        
                            <td><g:formatBoolean boolean="${anamneseInstance.anestesia}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${anamneseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
