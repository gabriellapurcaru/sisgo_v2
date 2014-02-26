
<%@ page import="sisgo.Agenda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="btn btn-primary" action="list">Listagem de Retornos</g:link></span>
        </div>
        <div class="body">
            <h1>Marcação</h1>
            <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>
                    

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="agenda.dataRetorno.label" default="Data Retorno" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${agendaInstance?.dataRetorno}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="agenda.paciente.label" default="Paciente" /></td>
                            
                            <td valign="top" class="value"><g:link controller="paciente" action="show" id="${agendaInstance?.paciente?.id}">${agendaInstance?.paciente?.nome}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="agenda.retorno.label" default="Motivo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: agendaInstance, field: "retorno")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${agendaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <!--<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>-->
                </g:form>
            </div>
        </div>
    </body>
</html>
