

<%@ page import="sisgo.fatura.FaturaFilha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'faturaFilha.label', default: 'FaturaFilha')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${faturaFilhaInstance}">
            <div class="errors">
                <g:renderErrors bean="${faturaFilhaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dhc"><g:message code="faturaFilha.dhc.label" default="Dhc" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaFilhaInstance, field: 'dhc', 'errors')}">
                                    <g:datePicker name="dhc" precision="day" value="${faturaFilhaInstance?.dhc}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataCriacao"><g:message code="faturaFilha.dataCriacao.label" default="Data Criacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaFilhaInstance, field: 'dataCriacao', 'errors')}">
                                    <g:datePicker name="dataCriacao" precision="day" value="${faturaFilhaInstance?.dataCriacao}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataVencimento"><g:message code="faturaFilha.dataVencimento.label" default="Data Vencimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaFilhaInstance, field: 'dataVencimento', 'errors')}">
                                    <g:datePicker name="dataVencimento" precision="day" value="${faturaFilhaInstance?.dataVencimento}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataPagamento"><g:message code="faturaFilha.dataPagamento.label" default="Data Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaFilhaInstance, field: 'dataPagamento', 'errors')}">
                                    <g:datePicker name="dataPagamento" precision="day" value="${faturaFilhaInstance?.dataPagamento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="faturaFilha.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaFilhaInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${faturaFilhaInstance.constraints.status.inList}" value="${faturaFilhaInstance?.status}" valueMessagePrefix="faturaFilha.status"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="faturaFilha.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaFilhaInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${faturaFilhaInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fatura"><g:message code="faturaFilha.fatura.label" default="Fatura" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaFilhaInstance, field: 'fatura', 'errors')}">
                                    <g:select name="fatura.id" from="${sisgo.fatura.Fatura.list()}" optionKey="id" value="${faturaFilhaInstance?.fatura?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
