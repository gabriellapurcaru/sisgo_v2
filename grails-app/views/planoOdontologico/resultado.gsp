
<%@ page import="sisgo.PlanoOdontologico" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'planoOdontologico.label', default: 'PlanoOdontologico')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div class="body">
    <h1>Listagem Planos Odontológicos</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table class="table table-bordered">
            <thead>
            <tr>
                <td>Código</td>
                <g:sortableColumn property="nome" title="${message(code: 'planoOdontologico.nome.label', default: 'Nome')}" />
                <g:sortableColumn property="valorPlano" title="${message(code: 'planoOdontologico.valorPlano.label', default: 'Valor Plano')}" />
                <g:sortableColumn property="tipoPlano" title="${message(code: 'planoOdontologico.tipoPlano.label', default: 'Tipo Plano')}" />
                <g:sortableColumn property="id" title="${message(code: 'planoOdontologico.id.label', default: 'Ações')}" />
            </tr>
            </thead>
            <tbody>
            <g:each in="${planoOdontologicoInstanceList}" status="i" var="planoOdontologicoInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td>${planoOdontologicoInstance.numeroPlano}</td>
                    <td>${fieldValue(bean: planoOdontologicoInstance, field: "nome")}</td>
                    <td>${fieldValue(bean: planoOdontologicoInstance, field: "valorPlano")}</td>
                    <td>${fieldValue(bean: planoOdontologicoInstance, field: "tipoPlano")}</td>
                    <td><g:link class="btn btn-mini" action="show" id="${planoOdontologicoInstance.id}">Visualizar</g:link></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <g:link class="btn btn-primary" action="create">Cadastrar Plano Odontológico</g:link>
    <div class="paginateButtons">
        <g:paginate total="${planoOdontologicoInstanceTotal}" />
    </div>
</div>
</body>
</html>
