

<%@ page import="sisgo.fatura.Fatura" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fatura.label', default: 'Fatura')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>Adicionar Plano Odontológico</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${faturaInstance}">
            <div class="errors">
                <g:renderErrors bean="${faturaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <g:hiddenField name="cliente.id" value="${params.cliente.id}" />

                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="fatura.nome.label" default="Nome Fatura" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${faturaInstance?.nome}" />
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
                                    <label for="formaRepeticao"><g:message code="fatura.formaRepeticao.label" default="Forma Repeticao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faturaInstance, field: 'formaRepeticao', 'errors')}">
                                    <g:select name="formaRepeticao" from="${faturaInstance.constraints.formaRepeticao.inList}" value="${faturaInstance?.formaRepeticao}" valueMessagePrefix="fatura.formaRepeticao"  />
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
