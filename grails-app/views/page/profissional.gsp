<html>
<head>
    <title>Erica Gonçalves</title>
    <meta name="layout" content="pag" />

</head>
<body>

<div id="conteudo" class="bdy">

    <div id="box-conteudo">
	        <div id="logo">
                <a href="${createLink(uri: '/page/inicio')}"><img src="${resource(dir:'images/imgs',file:'logo02.png')}" /></a>
            </div>

            <span>
                ${profissionalList?.texto[0]}
            </span>
    </div>
    <div id="box-conteudo-left">
        <h2>profissional</h2>
        <div>
            <div id="img-dentista">
                <img src="${createLink(controller:'fileUploader', action:'show', id:profissionalList.imagemId )}" />
                 <!-- <img width="300" height="227" src="${createLink(controller:'conteudo', action:'imagem', id:params.id)}"/> -->
            </div>
            <div id="texto">
                <h1>Dra. Érica Gonçalves</h1>
                <p>Graduada  pela Universidade de Fortaleza (UNIFOR) em 2006</p>
                <p>Especialista em Endodontia pela Associação Brasileira de Odontologia (ABO-CE)</p>
                <p>Pós-Graduada em Odontologia Estética pela Academia Cearense de Odontologia (CEC)</p>
                <p>Pós-Graduanda em Implantodontia pela Academia Cearense de Odontologia (CEC)</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
