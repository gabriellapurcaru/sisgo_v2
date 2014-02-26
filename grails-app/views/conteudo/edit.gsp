
<%@ page import="com.lucastex.grails.fileuploader.UFile" %>
<%@ page import="sisgo.Conteudo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'conteudo.label', default: 'Conteudo')}" />
        <title>Erica Gonçalves</title>
        <resource:richTextEditor />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/page/inicio')}">Ir para Site</a></span>
            <span class="menuButton"><a class="home" href="${createLink(uri: '/page/admin')}">Início</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listar Páginas</g:link></span>
        </div>
        <div class="form">

            <h1>Atualizar Informações</h1>

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${conteudoInstance}">
                <div class="errors">
                    <g:renderErrors bean="${conteudoInstance}" as="list" />
                </div>
            </g:hasErrors>

            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${conteudoInstance?.id}" />
                <g:hiddenField name="version" value="${conteudoInstance?.version}" />

                <div class="fc1">
                    <label for="titulo"><g:message code="conteudo.titulo.label" default="Titulo" /></label>
                    <g:textField class="fc1" name="titulo" cols="40" rows="5" value="${conteudoInstance?.titulo}" />
                </div>

                <div class="fc1">
                    <label for="texto"><g:message code="conteudo.texto.label" default="Texto" /></label>
                    <div style="float: left;" >
                        <richui:richTextEditor name="texto" value="${conteudoInstance?.texto}" width="525" />
                    </div>
                </div>

                <%if(!conteudoInstance?.imagemId || conteudoInstance?.imagemId.equals(0) ){%>
                <div class="fc1">
                    <img width="300px" height="230px" border="1px" style="margin:3px;" src="${createLinkTo(dir:'images/imgs/',file:'img03.png')}" />
                </div>
                <%}else{%>
                <div class="fc1">
                    <img width="300px" height="230px" src="${createLink(controller:'fileUploader', action:'show', id:conteudoInstance.imagemId )}" />
                </div>
                <%}%>

                <div class="fc1">
                    <p class="fc2">
                        <label for="imagemId">Alterar/Adicionar Imagem:</label>
                        <g:select class="select" name="imagemId" id="imagemId" from="${com.lucastex.grails.fileuploader.UFile.list()}" optionValue="name" optionKey="id" value="${fieldValue(bean:conteudo,field:'imagemId')}" noSelection="[0:'-Selecione uma opção-']"/>
                    </p>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Atualizar" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="Deletar" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
