

<%@ page import="sisgo.fatura.Fatura" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fatura.label', default: 'Fatura')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>

    <ul class="breadcrumb">
        <li><g:link controller="page" action="admin">Início</g:link><span class="divider">/</span></li>
        <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li>
        <li><g:link controller="cliente" action="list">Cliente</g:link><span class="divider">/</span></li>
        <li class="active">Plano Contratado</li>
    </ul>
        <div class="body">
            <h1>Atualizar Dados Plano Contratado</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${faturaInstance}">
            <div class="errors">
                <g:renderErrors bean="${faturaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${faturaInstance?.id}" />
                <g:hiddenField name="version" value="${faturaInstance?.version}" />
                <div class="dialog">
                    <table class="table table-bordered">
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="cliente"><g:message code="fatura.cliente.label" default="Cliente" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'cliente', 'errors')}">
                                <label>${faturaInstance?.cliente?.nome}</label>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="planoOdontologico"><g:message code="fatura.planoOdontologico.label" default="Plano Odontologico" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'planoOdontologico', 'errors')}">
                                <g:select name="planoOdontologico.id" from="${sisgo.PlanoOdontologico.list()}" optionKey="id" value="${faturaInstance?.planoOdontologico?.id}"  />
                            </td>
                        </tr>




                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="diaDoVencimento"><g:message code="fatura.diaDoVencimento.label" default="Dia do Vencimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'diaDoVencimento', 'errors')}">
                                    <g:select name="diaDoVencimento" from="${faturaInstance.constraints.diaDoVencimento.inList}" value="${faturaInstance?.diaDoVencimento}" valueMessagePrefix="fatura.diaDoVencimento"  />
                                </td>
                            </tr>


                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataInicio"><g:message code="fatura.dataInicio.label" default="Data Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'dataInicio', 'errors')}">
                                    <g:datePicker name="dataInicio" precision="day" value="${faturaInstance?.dataInicio}"  />
                                </td>
                            </tr>

                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataTermino"><g:message code="fatura.dataTermino.label" default="Data Termino" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'dataTermino', 'errors')}">
                                    <g:datePicker name="dataTermino" precision="day" value="${faturaInstance?.dataTermino}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>

                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="fatura.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${faturaInstance?.descricao}" />
                                </td>
                            </tr>

                        <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ativa"><g:message code="fatura.ativa.label" default="Ativa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'ativa', 'errors')}">
                                    <g:checkBox name="ativa" value="${faturaInstance?.ativa}" />
                                </td>
                            </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="nome"><g:message code="fatura.nome.label" default="Descrição" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'nome', 'errors')}">
                                <g:textField name="nome" value="${faturaInstance?.nome}" />
                            </td>
                        </tr>
                        <!--
                        <tr class="prop">
                            <td valign="top" class="name">
                              <label for="faturasFilhas"><g:message code="fatura.faturasFilhas.label" default="Faturas Filhas" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'faturasFilhas', 'errors')}">

<ul>
<g:each in="${faturaInstance?.faturasFilhas?}" var="f">
<li><g:link controller="faturaFilha" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="faturaFilha" action="create" params="['fatura.id': faturaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'faturaFilha.label', default: 'FaturaFilha')])}</g:link>

                            </td>
                        </tr>
                        -->

                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="btn" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
