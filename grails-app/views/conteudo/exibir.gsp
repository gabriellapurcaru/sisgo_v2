
<%@ page import="sisgo.Conteudo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="pag" />
        <g:set var="entityName" value="${message(code: 'conteudo.label', default: 'Conteudo')}" />
        <title>Erica Gonçalves</title>

    </head>
    <body>


    <div id="conteudo" class="bdy">

        <div id="box-conteudo">
            <div id="logo">
                <a href="${createLink(uri: '/page/inicio')}"><img src="${resource(dir:'images/imgs',file:'logo02.png')}" /></a>
            </div>

            <h3>${conteudoInstance.titulo}</h3>

            <div id="texto-print">
                ${conteudoInstance.texto}
            </div>


            <%if(conteudoInstance.categoria.equals("ESPECIALIDADE") ){%>
                    <% def x = Conteudo.findByFaqEspId(conteudoInstance.id) %>
                    <a class="e1" href="${createLink(controller:'conteudo',action:'exibir',id:x?.id)}">Perguntas e Respostas sobre ${conteudoInstance.titulo}</a>

            <%}else if(conteudoInstance.categoria.equals("CURIOSIDADE")){%>
                <a class="e1" href="${createLink(controller:'conteudo',action:'listagem')}">ver outras curiosidades</a>
            <%}%>

        </div>

        <div id="box-conteudo-left">
            <%if(conteudoInstance.categoria.equals("ESPECIALIDADE")){%>
                <h2 style="margin: 20px 20px 0px 0px;">especialidades</h2>

                <g:each in="${noticiaList}" status="i" var="e">
                    <p class="par">
                        <a class="e1" href="${createLink(controller:'conteudo',action:'exibir', params:[titulo:e.titulo])} "><span>${e.titulo}</span></a>
                    </p>
                </g:each>
            <%}else if(conteudoInstance.categoria.equals("CURIOSIDADE")){%>
                <h2>curiosidades</h2>

            <%}else if(conteudoInstance.categoria.equals("FAQ")){%>
                <h2 style="margin: 20px 20px 0px 0px;">especialidades</h2>

            <g:each in="${noticiaList}" status="i" var="e">
                    <p class="par">
                        <a class="e1" href="${createLink(controller:'conteudo',action:'exibir', id:e.id)}"><span>${e.titulo}</span></a>
                    </p>
                </g:each>
            <%}%>



                <div id="img-dentista">
                <div style="padding:2px;">
                    <img  width="300" height="230" src="${createLink(controller:'fileUploader', action:'show', id:conteudoInstance.imagemId )}" />
                </div>
                </div>


        </div>
   </div>
    </body>
</html>
