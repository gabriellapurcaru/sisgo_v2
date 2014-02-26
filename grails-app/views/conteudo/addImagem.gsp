

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
    <span class="menuButton"><a class="home" href="${createLink(uri: '/page/inicio')}">Ir para Site</a></span>
    <span class="menuButton"><g:link class="home" controller="page" action="admin">Painel</g:link></span>
    <span class="menuButton"><g:link class="list" action="list">Listar Páginas</g:link></span>
</div>

<div class="form">
    <h1>Cadastrar nova Imagem</h1>

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${conteudoInstance}">
        <div class="errors">
            <g:renderErrors bean="${conteudoInstance}" as="list" />
        </div>
    </g:hasErrors>

    <div class="addimage">
        <richui:accordion>
            <richui:accordionItem id="1" caption="Cadastrar Nova Imagem">
                <fileuploader:form upload="avatar" successAction="create" successController="conteudo" errorAction="create" errorController="conteudo" id="conteudoInstance.imagemId"/>
            </richui:accordionItem>
        </richui:accordion>
    </div>



</div>
</body>
</html>
