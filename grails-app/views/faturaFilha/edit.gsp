

<%@ page import="sisgo.fatura.FaturaFilha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'faturaFilha.label', default: 'FaturaFilha')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <!--
    <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
    -->
        <div class="body">
            <h1>Adicionar Pagamento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${faturaFilhaInstance}">
            <div class="errors">
                <g:renderErrors bean="${faturaFilhaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${faturaFilhaInstance?.id}" />
                <g:hiddenField name="version" value="${faturaFilhaInstance?.version}" />
                <div class="dialog">
                    <table class="table table-bordered">
                        <tbody>
                        


                        
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
                                    <g:select name="status" from="${['Fechada']}" value="${faturaFilhaInstance?.status}" valueMessagePrefix="faturaFilha.status"  />
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
                        

                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="btn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
