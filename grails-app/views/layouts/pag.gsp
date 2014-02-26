<!DOCTYPE html>
<html>
<head>
    <title>Erica Gonçalves</title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />

    <g:layoutHead />
    <g:javascript library="application" />

    <script type="text/javascript"  src="${resource(dir:'js',file:'jquery-1.4.2.min.js')}"></script>
    <script type="text/javascript"  src="${resource(dir:'js',file:'jquery-ui-1.7.1.custom.min.js')}"></script>
    <script type="text/javascript"  src="${resource(dir:'js',file:'jquery.meio.mask.min.js')}"></script>
    <script type="text/javascript"  src="${resource(dir:'js',file:'jquery.simplemodal-1.3.js')}"></script>
    <script type="text/javascript"  src="${resource(dir:'js',file:'imagem.js')}"></script>

    <resource:lightBox />

    <link rel="stylesheet" href="${resource(dir:'css',file:'lytebox.css')}" />
    <g:javascript src="lytebox.js" />

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-39727397-1', 'ericagoncalves.com.br');
        ga('send', 'pageview');

    </script>
</head>

<body>
<div id="geral">
    <div id="meio">
        <div id="box-meio" class="bdy">
            <g:layoutBody />

            <div id="col-esq">
                <div style="float:left;padding:2px 10px;width:30px;margin: 10px 0;">
                    <a href="https://www.facebook.com/pages/Dra-Erica-Gon%C3%A7alves/188528367945110?ref=hl" target="_blank">
                        <img src="${createLinkTo(dir:'images/',file:'face.png')}" />
                    </a>
                </div>
                <div id="box-menu">
                    <div class="modulo_menu_esq">

                    </div>
                    <div class="modulo_menu_dir">
                        <ul class="menu">
                            <li class="item"><a href="${createLink(controller:'page',action:'profissional')}"><span>profissional</span></a></li>
                            <li class="item"><a href="${createLink(controller:'page',action:'especialidades')}"><span>especialidades</span></a></li>
                            <li class="item"><a href="${createLink(controller:'page',action:'credenciamento')}"><span>credenciamento</span></a></li>
                            <li class="item"><a href="${createLink(controller:'conteudo',action:'listagem')}"><span>curiosidades</span></a></li>
                            <li class="item"><a href="${createLink(controller:'page',action:'faleComigo')}"><span>fale comigo</span></a></li>
                            <li class="item"><a href="${createLink(controller:'page',action:'login')}">login</a></li>
                        </ul>
                    </div>
                </div>
        </div>
    </div>
    <div id="rodape">
        <div id="box-rodape">
            <div id="meio">
                <div style="float:right;width:970px;text-align: center;">
                    Rua Carolina Sucupira, 444 - Aldeota, Fortaleza - CE, 60140-120 - (85)3244-2323<br/>
                    © 2011. Todos os direitos reservados.
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</body>
</html>