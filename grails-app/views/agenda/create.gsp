

<%@ page import="sisgo.Agenda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="btn btn-primary" action="list" params="['paciente.id': params?.id]">Retornos Marcados</g:link></span>
        </div>
        <div class="body">
            <h1>Marcar Retorno</h1>
            <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${agendaInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${agendaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataRetorno"><g:message code="agenda.dataRetorno.label" default="Data Retorno" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'dataRetorno', 'errors')}">
                                    <g:datePicker name="dataRetorno" precision="day" value="${agendaInstance?.dataRetorno}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paciente"><g:message code="agenda.paciente.label" default="Paciente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'paciente', 'errors')}">
                                    <g:select name="paciente.id" from="${sisgo.Paciente.list()}" optionKey="id" optionValue="nome" value="${agendaInstance?.paciente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="retorno"><g:message code="agenda.retorno.label" default="Motivo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'Motivo', 'errors')}">
                                    <textarea rows="3" cols="3" name="retorno"></textarea>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="btn" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
