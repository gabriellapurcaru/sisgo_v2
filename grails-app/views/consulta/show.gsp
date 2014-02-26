
<%@ page import="sisgo.Consulta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Data Consulta:</td>

                            <td valign="top" class="value">
                                <g:formatDate format="dd-MM-yyyy" date="${consultaInstance?.dataConsulta}"/>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="consulta.paciente.label" default="Paciente" /></td>
                            
                            <td valign="top" class="value"><g:link controller="paciente" action="show" id="${consultaInstance?.paciente?.id}">${consultaInstance?.paciente?.nome}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="consulta.planos.label" default="Planos" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${consultaInstance.planos}" var="p">
                                    <li><g:link controller="planoTratamento" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                                <g:link controller="planoTratamento" action="create" params="['consulta.id': consultaInstance?.id]">Criar Plano de Tratamento</g:link>

                            </td>
                            
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${consultaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
