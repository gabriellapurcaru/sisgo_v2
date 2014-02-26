

<%@ page import="sisgo.PagamentoPlano" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamentoPlano.label', default: 'PagamentoPlano')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pagamentoPlanoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pagamentoPlanoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pagamentoPlanoInstance?.id}" />
                <g:hiddenField name="version" value="${pagamentoPlanoInstance?.version}" />
                <div class="dialog">
                    <table class="table table-bordered">
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
                                <label for="dia"><g:message code="pagamentoPlano.dia.label" default="Dia" /></label>
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
                    <span class="button"><g:actionSubmit class="btn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
