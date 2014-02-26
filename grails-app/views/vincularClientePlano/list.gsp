
<%@ page import="sisgo.VincularClientePlano" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vincularClientePlano.label', default: 'VincularClientePlano')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li><g:link controller="page" action="admin">Início</g:link><span class="divider">/</span></li>
                <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li>
                <li><g:link controller="cliente" action="list">Cliente</g:link><span class="divider">/</span></li>
                <li class="active">Plano Contratado</li>
            </ul>

            <h1>Plano Contratados</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>

            <g:form action="resultado" method="GET" >
                <div class="input-append">
                    <label>Nome do Cliente:</label><input class="span2" id="nome" name="nome" size="30" type="text"><input  class="btn" type="submit" value="Pesquisar" />
                </div>
            </g:form>

            <div class="alert alert-info">
                <b>Total de Planos Contratados: ${vincularClientePlanoInstanceTotal}</b>
            </div>
            <div class="list">

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th><g:message code="vincularClientePlano.cliente.label" default="Cliente" /></th>
                            <th>Data Inclusão</th>
                            <th>Data Vencimento</th>
                            <th>Período Contratual</th>
                            <th>Valor Plano</th>
                            <th>Tipo Plano</th>
                            <th>Status</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vincularClientePlanoInstanceList}" status="i" var="vincularClientePlanoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${vincularClientePlanoInstance?.codigo}</td>
                            <td>${fieldValue(bean: vincularClientePlanoInstance, field: "cliente")}</td>
                            <td><g:formatDate date="${vincularClientePlanoInstance.dataInclusao}" /></td>
                            <td>${vincularClientePlanoInstance?.dia} - ${vincularClientePlanoInstance?.mes}</td>
                            <td>${fieldValue(bean: vincularClientePlanoInstance, field: "periodoContratual")}</td>
                            <td>${vincularClientePlanoInstance?.planoOdontologico?.valorPlano}</td>
                            <td>${vincularClientePlanoInstance?.planoOdontologico?.tipoPlano}</td>
                            <td>
                                <g:if test="${vincularClientePlanoInstance?.status?.equals('ATIVO')}">
                                    ATIVO
                                </g:if>
                                <g:else test="${vincularClientePlanoInstance?.status?.equals('CANCELADO')}">
                                    CANCELADO
                                </g:else>
                            </td>

                            <td>
                                <g:form style="margin:0px 0px 5px 0px;">
                                    <g:hiddenField name="id" value="${vincularClientePlanoInstance?.id}" />
                                    <span class="button"><g:actionSubmit class="btn btn-mini" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                                </g:form>
                                <g:link controller="pagamentoPlano" action="create" class="btn btn-mini" params="['vincularClientePlano.id': vincularClientePlanoInstance?.id]">Adicionar Pagamento</g:link><br/>
                                <g:link style="margin-top:5px;" controller="pagamentoPlano" action="list" class="btn btn-mini"
                                        params="['vincularClientePlano.id': vincularClientePlanoInstance?.id]">Histórico</g:link>

                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <input type="button" class="btn" name="imprimir" value="Imprimir" onclick="window.print();">
            </div>
            <div class="paginateButtons">
                <g:paginate total="${vincularClientePlanoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
