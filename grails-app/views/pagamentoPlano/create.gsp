

<%@ page import="sisgo.PagamentoPlano" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamentoPlano.label', default: 'PagamentoPlano')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li>
                <li><g:link controller="cliente" action="list">Clientes</g:link><span class="divider">/</span></li>
                <li><g:link controller="vincularClientePlano" action="list">Planos Contratados</g:link><span class="divider">/</span></li>
                <li class="active">Pagamento</li>
            </ul>

            <h1>Adicionar Pagamento</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pagamentoPlanoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pagamentoPlanoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <g:hiddenField name="fatura.id" value="${params.fatura.id}" />

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="formaPagamento"><g:message code="pagamentoPlano.formaPagamento.label" default="Forma Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagamentoPlanoInstance, field: 'formaPagamento', 'errors')}">
                                    <g:select name="formaPagamento" from="${pagamentoPlanoInstance.constraints.formaPagamento.inList}" value="${pagamentoPlanoInstance?.formaPagamento}" valueMessagePrefix="pagamentoPlano.formaPagamento"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label>Data Pagamento</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagamentoPlanoInstance, field: 'dia', 'errors')}">
                                    <g:select name="dia" from="${pagamentoPlanoInstance.constraints.dia.inList}" value="${pagamentoPlanoInstance?.dia}" valueMessagePrefix="pagamentoPlano.dia"  />
                                    <g:select name="mes" from="${pagamentoPlanoInstance.constraints.mes.inList}" value="${pagamentoPlanoInstance?.mes}" valueMessagePrefix="pagamentoPlano.mes"  />
                                    <g:select name="ano" from="${pagamentoPlanoInstance.constraints.ano.inList}" value="${pagamentoPlanoInstance?.ano}" valueMessagePrefix="pagamentoPlano.ano"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="pagamentoPlano.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pagamentoPlanoInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${pagamentoPlanoInstance.constraints.status.inList}" value="${pagamentoPlanoInstance?.status}" valueMessagePrefix="pagamentoPlano.status"  />
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
