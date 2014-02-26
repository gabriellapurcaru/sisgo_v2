

<%@ page import="sisgo.Agenda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a href="javascript:window.history.go(-1)" class="btn btn-primary">Voltar</a></span>
        </div>
        <div class="body">

            <h2>Atualizar Retorno Paciente: ${agendaInstance?.paciente?.nome}</h2>
            <h5></h5>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${agendaInstance}">
            <div class="errors">
                <g:renderErrors bean="${agendaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${agendaInstance?.id}" />
                <g:hiddenField name="version" value="${agendaInstance?.version}" />
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
                                  <label for="retorno"><g:message code="agenda.retorno.label" default="Retorno" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: agendaInstance, field: 'retorno', 'errors')}">
                                    <g:textArea rows="3" cols="10" name="retorno" value="${agendaInstance?.retorno}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="btn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <!--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>-->
                </div>
            </g:form>
        </div>
    </body>
</html>
