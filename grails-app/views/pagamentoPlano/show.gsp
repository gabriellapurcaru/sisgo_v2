
<%@ page import="sisgo.PagamentoPlano" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamentoPlano.label', default: 'PagamentoPlano')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">

            <ul class="breadcrumb">
                <li><g:link controller="page" action="admin">Início</g:link><span class="divider">/</span></li>
                <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li>
                <li><g:link controller="cliente" action="list">Clientes</g:link><span class="divider">/</span></li>
                <li><g:link controller="vincularClientePlano" action="list">Planos Contratados</g:link><span class="divider">/</span></li>
                <li class="active">Pagamento</li>
            </ul>


            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="formaPagamento"><g:message code="pagamentoPlano.formaPagamento.label" default="Forma Pagamento" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: pagamentoPlanoInstance, field: 'formaPagamento', 'errors')}">
                            ${pagamentoPlanoInstance?.formaPagamento}
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dia"><g:message code="pagamentoPlano.dia.label" default="Dia" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: pagamentoPlanoInstance, field: 'dia', 'errors')}">
                            ${pagamentoPlanoInstance?.dia} - ${pagamentoPlanoInstance?.mes} - ${pagamentoPlanoInstance?.ano}
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="status"><g:message code="pagamentoPlano.status.label" default="Status" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: pagamentoPlanoInstance, field: 'status', 'errors')}">
                            ${pagamentoPlanoInstance?.status}
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${pagamentoPlanoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
