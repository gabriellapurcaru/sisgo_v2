
<%@ page import="sisgo.fatura.FaturaFilha" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'faturaFilha.label', default: 'FaturaFilha')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="btn" action="pesquisa">Pesquisar Pagamentos</g:link></span>
        </div>
        <div class="body">
            <h1>Faturas</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <td>Cliente</td>
                            <g:sortableColumn property="fatura" title="${message(code: 'faturaFilha.fatura.nome.label', default: 'fatura')}" />
                            <g:sortableColumn property="dataCriacao" title="Data Inclusão" />
                            <g:sortableColumn property="dataVencimento" title="${message(code: 'faturaFilha.dataVencimento.label', default: 'Data Vencimento')}" />
                            <g:sortableColumn property="dataPagamento" title="${message(code: 'faturaFilha.dataPagamento.label', default: 'Data Pagamento')}" />
                            <g:sortableColumn property="status" title="${message(code: 'faturaFilha.status.label', default: 'Status')}" />
                            <g:sortableColumn property="id" title="Ação" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${faturaFilhaInstanceList}" status="i" var="faturaFilhaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${faturaFilhaInstance?.fatura?.cliente?.nome}</td>
                            <td>${faturaFilhaInstance.fatura.nome}</td>
                            <td><g:formatDate date="${faturaFilhaInstance.dataCriacao}" /></td>
                            <td><g:formatDate date="${faturaFilhaInstance.dataVencimento}" /></td>
                            <td><g:formatDate date="${faturaFilhaInstance.dataPagamento}" /></td>
                            <td>
                                <g:if test="${faturaFilhaInstance?.status?.equals('Aberta')}">
                                    <span class="label label-info">${fieldValue(bean: faturaFilhaInstance, field: "status")}</span>
                                </g:if>
                                <g:if test="${faturaFilhaInstance?.status?.equals('Atrasada')}">
                                    <span class="label label-important">${fieldValue(bean: faturaFilhaInstance, field: "status")}</span>
                                </g:if>
                                <g:if test="${faturaFilhaInstance?.status?.equals('Fechada')}">
                                    <span class="label label-success">${fieldValue(bean: faturaFilhaInstance, field: "status")}</span>
                                </g:if>
                            </td>
                            <td><g:link class="btn" action="show" id="${faturaFilhaInstance.id}">Visualizar</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${faturaFilhaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
