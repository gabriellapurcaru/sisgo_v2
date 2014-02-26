
<%@ page import="sisgo.Conteudo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'conteudo.label', default: 'Conteudo')}" />
        <title>Erica Gonçalves</title>
    </head>
    <body>
        <div class="nav">
            <a class="btn btn-primary" href="${createLink(uri: '/page/inicio')}">Ir para Site</a>
            <g:link class="btn btn-primary" controller="page" action="admin">Painel</g:link>
            <g:link class="btn btn-primary" action="create">Nova Página</g:link>
            <g:link controller="conteudo" class="btn btn-primary" action="addImagem">Nova Imagem</g:link>
        </div>
        <div class="form">

            <h1>Páginas Criadas</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Categoria</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${conteudoInstanceList}" status="i" var="conteudoInstance">
                        <tr>
                            <td>${fieldValue(bean: conteudoInstance, field: "titulo")}</td>
                            <td>${fieldValue(bean: conteudoInstance, field: "categoria")}</td>
                            <td><g:link action="show" id="${conteudoInstance.id}">Visualizar</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${conteudoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
