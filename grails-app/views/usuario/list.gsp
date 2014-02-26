
<%@ page import="sisgo.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="senha" title="${message(code: 'usuario.senha.label', default: 'Senha')}" />
                        
                            <g:sortableColumn property="ativo" title="${message(code: 'usuario.ativo.label', default: 'Ativo')}" />
                        
                            <g:sortableColumn property="categoria" title="${message(code: 'usuario.categoria.label', default: 'Categoria')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioList}" status="i" var="usuario">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${usuario.id}">${fieldValue(bean: usuario, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: usuario, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: usuario, field: "email")}</td>
                        
                            <td>${fieldValue(bean: usuario, field: "senha")}</td>
                        
                            <td><g:formatBoolean boolean="${usuario.ativo}" /></td>
                        
                            <td>${fieldValue(bean: usuario, field: "categoria")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${usuarioTotal}" />
            </div>
        </div>
    </body>
</html>
