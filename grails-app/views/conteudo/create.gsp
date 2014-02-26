

<%@ page import="sisgo.Conteudo" %>
<%@ page import="com.lucastex.grails.fileuploader.UFile" %>
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
            <a class="btn btn-primary" href="${createLink(uri: '/page/inicio')}">Ir para Site</a>
            <g:link class="btn btn-primary" controller="page" action="admin">Painel</g:link>
            <g:link class="btn btn-primary" action="list">Listar Páginas</g:link>
        </div>

        <div class="form">
            <h1>Cadastrar nova Página</h1>

            <g:if test="${flash.message}">
                <div class="alert fade in">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${conteudoInstance}">
                <div class="alert alert-block alert-error fade in">
                    <g:renderErrors bean="${conteudoInstance}" as="list" />
                </div>
            </g:hasErrors>

            <g:form action="save" method="post" enctype="multipart/form-data">

                <div class="controls">
                    <label for="titulo"><g:message code="conteudo.titulo.label" default="Titulo" /></label>
                    <g:textField class="span6" name="titulo" cols="40" rows="5" value="${conteudoInstance?.titulo}" />
                </div>


                <div class="controls">
                    <%if(!params?.especialidade){%>
                    <p class="fc2">
                        <label for="categoria"><g:message code="conteudo.categoria.label" default="Categoria" /></label>
                        <g:select class="span3" name="categoria" id="categoria" from="${['PROFISSIONAL','CURIOSIDADE', 'ESPECIALIDADE']}" value="${fieldValue(bean:conteudo,field:'conteudoInstance')}" noSelection="['':'-Selecione uma opção -']"/>
                    </p>
                    <% }else{%>
                    <p class="fc2">
                        <g:hiddenField name="faqEspId" value="${conteudoInstance?.faqEspId}" />
                        <g:hiddenField name="categoria" value="${conteudoInstance?.categoria}" />
                    </p>
                    <%}%>
                </div>


                <div class="controls">
                    <p class="fc2">
                       <label for="imagemId">Selecione uma imagem para o curso:</label>
                       <g:select class="span3" name="imagemId" id="imagemId" from="${com.lucastex.grails.fileuploader.UFile.list()}" optionValue="name" optionKey="id" value="${fieldValue(bean:conteudo,field:'imagemId')}" noSelection="[0:'-Selecione uma opção-']"/>


                    </p>

                </div>

                <div class="fc2">
                    <label for="texto"><g:message code="conteudo.texto.label" default="Texto" /></label>
                    <div style="float: left;" >
                        <richui:richTextEditor name="texto"  value="${conteudoInstance?.texto}" width="566" />
                    </div>
                </div>

                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="btn btn-mini" value="Cadastrar" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
