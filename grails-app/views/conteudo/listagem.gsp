
<%@ page import="sisgo.Conteudo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="pag" />
        <g:set var="entityName" value="${message(code: 'conteudo.label', default: 'Conteudo')}" />

        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="conteudo" class="bdy">
        <div id="box-topo">
            <h2 style="margin: 45px 20px 5px 0px;width: 200px;float:left;">curiosidades</h2>
            <div class="logo">
                <a href="${createLink(uri: '/page/inicio')}"><img src="${resource(dir:'images/imgs',file:'logo02.png')}" /></a>
            </div>
        </div>
        <div id="box-conteudo-meio">
             <span>
                <div class="cred">
                    <g:each in="${noticiaList}" status="i" var="e">
                        <div class="img_cred">
                            <img width="130" height="100" class="img" src="${createLink(controller:'fileUploader', action:'show', id:e.imagemId)}"/><br />

                            <a class="e1" href="${createLink(controller:'conteudo',action:'exibir', params:[titulo:e.titulo])}"><span>${e.titulo}</span></a>
                        </div>
                    </g:each>
                </div>

            </span>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${conteudoInstanceTotal}" />
        </div>
        </div>
    </body>
</html>
