
<%@ page import="sisgo.fatura.Fatura" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fatura.label', default: 'Fatura')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <h1>Planos Contratados</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>

            <ul class="breadcrumb">
                <li><g:link controller="page" action="admin">Início</g:link><span class="divider">/</span></li>
                <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li>
                <li><g:link controller="cliente" action="list">Cliente</g:link><span class="divider">/</span></li>
                <li class="active">Plano Contratado</li>
            </ul>

            <g:form action="resultado" method="GET" >
                <div class="input-append">
                    <label>Nome do Cliente:</label><input class="span2" id="nome" name="nome" size="30" type="text"><input  class="btn" type="submit" value="Pesquisar" />
                </div>
            </g:form>

            <div class="alert alert-info">
                <b>Total de Planos Contratados: ${faturaInstanceTotal}</b>
            </div>
            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Cliente</th>
                            <th>Data Inclusão</th>
                            <th>Vencimento</th>
                            <th>Tipo Plano</th>
                            <th>Valor Plano</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${faturaInstanceList}" status="i" var="faturaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: faturaInstance, field: "codigo")}</td>
                            <td>${fieldValue(bean: faturaInstance, field: "cliente")}</td>
                            <td><g:formatDate date="${faturaInstance.dataInicio}" /></td>
                            <td>${fieldValue(bean: faturaInstance, field: "diaDoVencimento")}</td>
                            <td>${fieldValue(bean: faturaInstance, field: "planoOdontologico")}</td>
                            <td>${fieldValue(bean: faturaInstance, field: "planoOdontologico.valorPlano")}</td>
                            <td>
                            <g:form style="margin:0px 0px 5px 0px;">

                                <g:hiddenField name="id" value="${faturaInstance?.id}" />
                                <span class="button"><g:actionSubmit class="btn btn-mini" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                            </g:form>

                               <!-- <g:link controller="faturaFilha" action="create" class="btn btn-mini"
                                        params="['fatura.id': faturaInstance?.id]">Adicionar Pagamento</g:link><br/>-->
                                <g:link style="margin-top:5px;" controller="faturaFilha" action="list" class="btn btn-mini"
                                        params="['fatura.id': faturaInstance?.id]">Histórico</g:link>

                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${faturaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
