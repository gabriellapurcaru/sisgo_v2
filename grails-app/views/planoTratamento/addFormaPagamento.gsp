

<%@ page import="sisgo.PlanoTratamento" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'planoTratamento.label', default: 'PlanoTratamento')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>

    <g:javascript library="prototype" />

</head>
<body>

<div class="body">

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${planoTratamentoInstance}">
        <div class="errors">
            <g:renderErrors bean="${planoTratamentoInstance}" as="list" />
        </div>
    </g:hasErrors>

    <g:form action="saveFormaPagamento" method="post" >
        <g:hiddenField name="planoTratamento.id" value="${planoTratamentoInstance?.id}" />

        <div class="form">
            <h1>Forma de Pagamento</h1>

            <ul class="breadcrumb">
                <li>
                    <b>Procedimento:</b> ${planoTratamentoInstance?.procedimento.nome} / ${planoTratamentoInstance?.procedimento?.especialidade?.nome}<br />
                    <b>Valor Procedimento:</b> R$ ${planoTratamentoInstance?.procedimento?.valor}
                </li>
            </ul>

            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <h4>Valor Procedimento</h4>
                        <g:textField name="valorProcedimento" value="${planoTratamentoInstance?.valorProcedimento}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <h4>Forma de Pagamento</h4>
                        <g:select class="w100" name="formaPagamento" id="formaPagamento" from="${['CHEQUE', 'CARTÃO DE CREDITO','DINHEIRO']}"  noSelection="['':'-Selecione uma opção -']"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <h4>Condições de Pagamento</h4>
                        <g:textField name="descricao" value="${planoTratamentoInstance?.descricao}" />
                    </td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name">
                        <h4>Valor Pago</h4>
                        <g:textField name="valorPago" value="${planoTratamentoInstance?.valorPago}" />
                    </td>
                </tr>


                </tbody>
            </table>

            <div class="buttons">
                <input class="btn btn-mini" type="submit" value="Salvar"/>
            </div>
        </div>

    </g:form>
</div>
</body>
</html>
