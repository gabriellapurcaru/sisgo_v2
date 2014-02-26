

<%@ page import="sisgo.Consulta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${consultaInstance}">
            <div class="errors">
                <g:renderErrors bean="${consultaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${consultaInstance?.id}" />
                <g:hiddenField name="version" value="${consultaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataConsulta"><g:message code="consulta.dataConsulta.label" default="Data Consulta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: consultaInstance, field: 'dataConsulta', 'errors')}">
                                    <g:datePicker name="dataConsulta" precision="day" value="${consultaInstance?.dataConsulta}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="paciente"><g:message code="consulta.paciente.label" default="Paciente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: consultaInstance, field: 'paciente', 'errors')}">
                                    <g:select name="paciente.id" from="${sisgo.Paciente.list()}" optionKey="id" value="${consultaInstance?.paciente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="planos"><g:message code="consulta.planos.label" default="Planos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: consultaInstance, field: 'planos', 'errors')}">
                                    
<ul>
<g:each in="${consultaInstance?.planos?}" var="p">
    <li><g:link controller="planoTratamento" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="planoTratamento" action="create" params="['consulta.id': consultaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
