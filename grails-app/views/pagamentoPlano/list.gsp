
<%@ page import="sisgo.PagamentoPlano" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pagamentoPlano.label', default: 'PagamentoPlano')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Pagamentos Realizados</h1>


            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Forma Pagamento</th>
                            <th>Data Pagamento</th>
                            <th>Data Pagamento</th>
                            <!--
                            <th>Status</th>
                            -->
                        </tr>
                    </thead>
                    <tbody>

                    <g:each in="${pagamentoPlanoInstanceList}" status="i" var="pagamentoPlanoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: pagamentoPlanoInstance, field: "formaPagamento")}</td>
                            <td>${fieldValue(bean: pagamentoPlanoInstance, field: "dia")}-${fieldValue(bean: pagamentoPlanoInstance, field: "mes")}-${fieldValue(bean: pagamentoPlanoInstance, field: "ano")}</td>


                            <td>

                                <g:if test="${pagamentoPlanoInstance?.status?.equals('PAGO')}">
                                    <span class="label label-info">PAGO</span>
                                </g:if>
                                <g:else test="${pagamentoPlanoInstance?.status?.equals('À PAGAR')}">
                                    <span class="label label-warning">À PAGAR</span>
                                </g:else>

                                <g:if test="${pagamentoPlanoInstance?.status?.equals('VENCIDO')}">
                                    <span class="label label-important">VENCIDO</span>
                                </g:if>


                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pagamentoPlanoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
