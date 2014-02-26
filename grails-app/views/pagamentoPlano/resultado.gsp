
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
    <g:form action="resultado" method="GET" >
        <div class="input-append">
           <table class="table">
               <tr>
                   <td>
                       <label>Pagamentos do Dia:</label>
                       <g:select class="span2" name="dia" id="dia" from="${['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31']}"  value="${pagamentoPlanoInstance?.dia}"  noSelection="['':'- Selecione -']"/> <br/><br/>
                   </td>
                   <td>
                       <label>Pagamentos do Mês:</label>
                       <g:select class="span2" name="mes" id="mes" from="${['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']}"  value="${pagamentoPlanoInstance?.mes}"  noSelection="['':'- Selecione -']"/><br/><br/>
                   </td>
               </tr>
               <tr>
                   <td>
                       <label>Forma de Pagamento:</label>
                       <g:select class="span2" name="formaPagamento" id="formaPagamento" from="${['DINHEIRO','CARNÊ','BOLETO','CARTÃO']}"  value="${pagamentoPlanoInstance?.formaPagamento}"  noSelection="['':'- Selecione -']"/><br/><br/>
                   </td>
                   <td>
                       <label>Status:</label>
                       <g:select class="span2" name="status" id="status" from="${['PAGO','À PAGAR','VENCIDO']}"  value="${pagamentoPlanoInstance?.status}"  noSelection="['':'- Selecione -']"/><br/><br/>
                   </td>
               </tr>

           </table>




            <input  class="btn" type="submit" value="Pesquisar" />
        </div>
    </g:form>
    <g:if test="${flash.message}">
        <div class="alert fade in">${flash.message}</div>
    </g:if>

    <div class="alert alert-info">
        <b>Total de Clientes: ${pagamentosTotal}</b>
    </div>

    <div class="list">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Cliente</th>
                <th>Forma Pagamento</th>
                <th>Data Pagamento</th>
                <th>Status</th>

            </tr>
            </thead>
            <tbody>

            <g:each in="${pagamentos}" status="i" var="pagamentoPlanoInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${pagamentoPlanoInstance?.vincularClientePlano?.cliente?.nome}</td>
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
        <g:paginate total="${pagamentosTotal}" />
    </div>
</div>
</body>
</html>
