
<%@ page import="sisgo.fatura.Fatura" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fatura.label', default: 'Fatura')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <ul class="breadcrumb">
                <li><g:link controller="page" action="admin">Início</g:link><span class="divider">/</span></li>
                <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li>
                <li><g:link controller="cliente" action="list">Cliente</g:link><span class="divider">/</span></li>
                <li class="active">Plano Contratado</li>
            </ul>
            <h1>Dados Plano Contratado</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="fatura.cliente.label" default="Cliente" /></td>

                        <td valign="top" class="value">${faturaInstance?.cliente?.encodeAsHTML()}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="fatura.planoOdontologico.label" default="Plano Odontologico" /></td>

                        <td valign="top" class="value">${faturaInstance?.planoOdontologico?.encodeAsHTML()}</td>

                    </tr>


                    <tr class="prop">
                            <td valign="top" class="name"><g:message code="fatura.diaDoVencimento.label" default="Dia Vencimento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: faturaInstance, field: "diaDoVencimento")}</td>
                            
                        </tr>

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="fatura.dataInicio.label" default="Data Inicio" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${faturaInstance?.dataInicio}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="fatura.dataTermino.label" default="Data Termino" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${faturaInstance?.dataTermino}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="fatura.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: faturaInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="fatura.ativa.label" default="Ativa" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${faturaInstance?.ativa}" /></td>
                            
                        </tr>
                    

                      <!--
                       <tr class="prop">
                            <td valign="top" class="name"><g:message code="fatura.faturasFilhas.label" default="Faturas Filhas" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${faturaInstance.faturasFilhas}" var="f">
                                    <li><g:link controller="faturaFilha" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                       -->

                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${faturaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
