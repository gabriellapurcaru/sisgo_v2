

<%@ page import="sisgo.Noticia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'noticia.label', default: 'Noticia')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${noticiaInstance}">
            <div class="errors">
                <g:renderErrors bean="${noticiaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imagem"><g:message code="noticia.imagem.label" default="Imagem" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: noticiaInstance, field: 'imagem', 'errors')}">
                                    <input type="file" id="imagem" name="imagem" />
                                </td>
                            </tr>



                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="texto"><g:message code="noticia.texto.label" default="Texto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: noticiaInstance, field: 'texto', 'errors')}">
                                    <g:textField name="texto" value="${noticiaInstance?.texto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo"><g:message code="noticia.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: noticiaInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${noticiaInstance?.titulo}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                    <td valign="top" class="name">
                                        <label for="resumo"><g:message code="noticia.resumo.label" default="Resumo da notícia" /></label>
                                    </td>
                                    <td valign="top" class="value ${hasErrors(bean: noticiaInstance, field: 'resumo', 'errors')}">
                                        <g:textField name="resumo" value="${noticiaInstance?.resumo}" />
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
