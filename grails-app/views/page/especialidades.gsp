<html>
<head>
    <title>Erica Gonçalves</title>
    <meta name="layout" content="pag" />

</head>
<body>

<div id="conteudo" class="bdy">
    <div id="box-topo">
        <h2 style="margin: 45px 20px 5px 0px;width: 200px;float:left;">especialidades</h2>
        <div class="logo">
            <a href="${createLink(uri: '/page/inicio')}"><img src="${resource(dir:'images/imgs',file:'logo02.png')}" /></a>
        </div>
    </div>
    <div id="box-conteudo-meio">
         <span>
            <div class="cred">
                <g:each in="${conteudoInstanceList}" status="i" var="e">
                    <div class="img_cred">
                        <img  width="130" height="100" src="${createLink(controller:'fileUploader', action:'show', id:e.imagemId )}" />
                        <a class="e1" href="${createLink(controller:'conteudo',action:'exibir', params:[titulo:e.titulo])} "><span>${e.titulo}</span></a>
                    </div>
                </g:each>
            </div>

        </span>
    </div>
</div>
</body>
</html>
