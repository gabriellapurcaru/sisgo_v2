<html>
<head>
    <title>Erica Gonçalves</title>
    <meta name="layout" content="pag" />

</head>
<body>

<div id="conteudo" class="bdy">
    <div id="box-topo">
        <h2 style="margin: 45px 20px 5px 0px;width: 200px;float:left;">fale comigo</h2>
        <div class="logo">
            <a href="${createLink(uri: '/page/inicio')}"><img src="${resource(dir:'images/imgs',file:'logo02.png')}" /></a>
        </div>

        <div id="box-conteudo-meio">
            <p><a class="e1">Deixe sua mensagem aqui</a></p>

            <div id="formulario_contato">
                <g:form action="enviarContato">
                    <input class="form" id="nome" placeholder="Nome" type='text' />
                    <input class="form" id="email" placeholder="Email" type='text' />
                    <input class="form" id="fone" placeholder="Telefone" type='text' />
                    <input class="form" id="assunto" placeholder="Assunto" type='text' />
                    <textarea class="form" id="mensagem" placeholder="Mensagem" type='text' ></textarea>

                    <input class="ok" type="submit" value="Enviar"/>
            </g:form>
            </div>
		</div>
    </div>
</div>
</body>
</html>
