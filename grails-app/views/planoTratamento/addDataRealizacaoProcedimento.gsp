

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

    <g:form action="saveDataRealizacaoProcedimento" method="post" >
        <g:hiddenField name="planoTratamento.id" value="${planoTratamentoInstance?.id}" />

        <div class="form">
            <h1>Forma de Pagamento</h1>

            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <h4>Data Realização Procedimento</h4>
                        <g:datePicker name="dhr" precision="day" value="${planoTratamentoInstance?.dhr}"  />
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
