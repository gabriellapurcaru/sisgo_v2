
<%@ page import="sisgo.PlanoTratamento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'planoTratamento.label', default: 'PlanoTratamento')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="paciente" action="list">voltar</g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: planoTratamentoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.dentes.label" default="Dentes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${planoTratamentoInstance.dentes}" var="d">
                                    <li><g:link controller="dente" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: planoTratamentoInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.dhc.label" default="Dhc" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${planoTratamentoInstance?.dhc}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.orcamento.label" default="Orcamento" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${planoTratamentoInstance?.orcamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.paciente.label" default="Paciente" /></td>
                            
                            <td valign="top" class="value"><g:link controller="paciente" action="show" id="${planoTratamentoInstance?.paciente?.id}">${planoTratamentoInstance?.paciente?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.pagamentoRealizado.label" default="Pagamento Realizado" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${planoTratamentoInstance?.pagamentoRealizado}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="planoTratamento.procedimento.label" default="Procedimento" /></td>
                            
                            <td valign="top" class="value"><g:link controller="procedimento" action="show" id="${planoTratamentoInstance?.procedimento?.id}">${planoTratamentoInstance?.procedimento?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${planoTratamentoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
