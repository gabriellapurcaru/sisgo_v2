
<%@ page import="sisgo.fatura.FaturaFilha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'faturaFilha.label', default: 'FaturaFilha')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <h1>Fatura</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="faturaFilha.fatura.label" default="Cliente" /></td>

                        <td valign="top" class="value">${faturaFilhaInstance?.fatura?.cliente?.nome}</td>

                    </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="faturaFilha.dataCriacao.label" default="Data Inclusão" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${faturaFilhaInstance?.dataCriacao}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="faturaFilha.dataVencimento.label" default="Data Vencimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${faturaFilhaInstance?.dataVencimento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="faturaFilha.dataPagamento.label" default="Data Pagamento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${faturaFilhaInstance?.dataPagamento}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="faturaFilha.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: faturaFilhaInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="faturaFilha.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: faturaFilhaInstance, field: "descricao")}</td>
                            
                        </tr>
                    

                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${faturaFilhaInstance?.id}" />
                    <g:if test="${faturaFilhaInstance?.status?.equals('Fechada')}">

                    </g:if>
                    <g:if test="(${(faturaFilhaInstance?.status?.equals('Aberta')) || (faturaFilhaInstance?.status?.equals('Atrasada'))}">
                        <span class="button"><g:actionSubmit class="btn" action="edit" value="Adicionar Pagamento" /></span>

                    </g:if>
                    <span class="button"><g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
