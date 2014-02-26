

<%@ page import="sisgo.PlanoTratamento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'planoTratamento.label', default: 'PlanoTratamento')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="home" controller="paciente" action="list">voltar</g:link></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${planoTratamentoInstance}">
            <div class="errors">
                <g:renderErrors bean="${planoTratamentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${planoTratamentoInstance?.id}" />
                <g:hiddenField name="version" value="${planoTratamentoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dentes"><g:message code="planoTratamento.dentes.label" default="Dentes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'dentes', 'errors')}">
                                    
<ul>
<g:each in="${planoTratamentoInstance?.dentes?}" var="d">
    <li><g:link controller="dente" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="dente" action="create" params="['planoTratamento.id': planoTratamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dente.label', default: 'Dente')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="planoTratamento.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${planoTratamentoInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dhc"><g:message code="planoTratamento.dhc.label" default="Dhc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'dhc', 'errors')}">
                                    <g:datePicker name="dhc" precision="day" value="${planoTratamentoInstance?.dhc}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orcamento"><g:message code="planoTratamento.orcamento.label" default="Orcamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'orcamento', 'errors')}">
                                    <g:checkBox name="orcamento" value="${planoTratamentoInstance?.orcamento}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="paciente"><g:message code="planoTratamento.paciente.label" default="Paciente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'paciente', 'errors')}">
                                    <g:select name="paciente.id" from="${sisgo.Paciente.list()}" optionKey="id" value="${planoTratamentoInstance?.paciente?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pagamentoRealizado"><g:message code="planoTratamento.pagamentoRealizado.label" default="Pagamento Realizado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'pagamentoRealizado', 'errors')}">
                                    <g:checkBox name="pagamentoRealizado" value="${planoTratamentoInstance?.pagamentoRealizado}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="procedimento"><g:message code="planoTratamento.procedimento.label" default="Procedimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'procedimento', 'errors')}">
                                    <g:select name="procedimento.id" from="${sisgo.Procedimento.list()}" optionKey="id" value="${planoTratamentoInstance?.procedimento?.id}"  />
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
