
<%@ page import="com.lucastex.grails.fileuploader.UFile" %>
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
            <a class="btn btn-primary" href="${createLink(uri: '/page/inicio')}">Ir para site</a>
            <g:link class="btn btn-primary" action="list">Listar Páginas</g:link>
            <g:link class="btn btn-primary" action="create">Nova Página</g:link>
        </div>

        <div class="form">

            <h1>Página Cadastrada</h1>

            <g:if test="${flash.message}">
                <div class="alert fade in">${flash.message}</div>
            </g:if>

            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="conteudo.titulo.label" default="Titulo" /></td>
                            <td valign="top" class="value">${fieldValue(bean: conteudoInstance, field: "titulo")}</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="conteudo.texto.label" default="Texto" /></td>

                            <td valign="top" class="value">${conteudoInstance?.texto.decodeHTML()}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="conteudo.categoria.label" default="Categoria" /></td>

                            <td valign="top" class="value">${fieldValue(bean: conteudoInstance, field: "categoria")}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="conteudo.criadaEm.label" default="Criada Em" /></td>
                            <td valign="top" class="value"><g:formatDate date="${conteudoInstance?.criadaEm}" /></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="conteudo.imagem.label" default="Imagem" /></td>
                            <td>
                                <%if(!conteudoInstance?.imagemId || conteudoInstance?.imagemId.equals(0) ){%>
                                <img width="300px" height="230px" border="1px" style="margin:3px;" src="${createLinkTo(dir:'images/imgs/',file:'img03.png')}" />
                                <%}else{%>
                                <img width="130" height="100" src="${createLink(controller:'fileUploader', action:'show', id:conteudoInstance.imagemId )}" />
                                <%}%>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${conteudoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn btn-mini" action="edit" value="Atualizar" /></span>
                    <span class="button"><g:actionSubmit class="btn btn-mini" action="delete" value="Deletar" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    <%if(conteudoInstance.categoria.equals("ESPECIALIDADE")){%>
                        <span class="btn btn-mini"><a href="${createLink(controller:'conteudo',action:'create', params:[especialidade: conteudoInstance.id])}">Adicionar FAQ</a></span>
                    <% }%>
                </g:form>
            </div>
        </div>
    </body>
</html>
