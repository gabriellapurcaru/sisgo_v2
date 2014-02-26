
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
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
</div>
<div class="body">
    <h1>Pagamentos Realizados</h1>
    <g:if test="${flash.message}">
        <div class="alert fade in">${flash.message}</div>
    </g:if>
    <div class="list">

        <div class="well">
            <g:form action="pesquisa" method="GET" >
                <div class="input-append date" id="datepicker" data-date="${hoje}" data-date-format="dd-mm-yyyy">
                    <label>Dia Ex: 12-06-2013</label>

                    <input name="dia" size="9" type="text" value="">
                    <span class="add-on"><i class="icon-th"></i></span>
                </div>
            </g:form>

            <g:form action="pesquisa" method="GET" >
                <div class="input-append date" id="dpMonths" data-date="${hoje}" data-date-format="mm-yyyy" data-date-viewmode="years" data-date-minviewmode="months">
                    <label>Mês Ex: 06-2013</label>

                    <input name="mes" class="span2" size="9" type="text" value="">
                    <span class="add-on"><i class="icon-calendar"></i></span>  </button>
                </div>
            </g:form>

            <g:form action="pesquisa" method="GET" >
                <label>Status</label>
                <g:select class="span2" name="status" id="status" from="${['Aberta','Atrasada','Fechada']}"  value="${faturaFilhaInstance?.status}"  noSelection="['':'- Selecione -']"/><br/><br/>
                <button type="submit" class="btn">Pesquisar por dia</button>
            </g:form>

        </div>

        <table class="table table-bordered">
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'faturaFilha.id.label', default: 'Id')}" />


                <g:sortableColumn property="fatura" title="${message(code: 'faturaFilha.fatura.nome.label', default: 'fatura')}" />

                <g:sortableColumn property="dataCriacao" title="${message(code: 'faturaFilha.dataCriacao.label', default: 'Data Criacao')}" />

                <g:sortableColumn property="dataVencimento" title="${message(code: 'faturaFilha.dataVencimento.label', default: 'Data Vencimento')}" />

                <g:sortableColumn property="dataPagamento" title="${message(code: 'faturaFilha.dataPagamento.label', default: 'Data Pagamento')}" />

                <g:sortableColumn property="status" title="${message(code: 'faturaFilha.status.label', default: 'Status')}" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${faturaFilhaInstanceList}" status="i" var="faturaFilhaInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${faturaFilhaInstance.id}">${fieldValue(bean: faturaFilhaInstance, field: "id")}</g:link></td>


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

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
