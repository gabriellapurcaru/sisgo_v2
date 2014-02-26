<!DOCTYPE html>
<html>
    <head>
        <title>Erica Gonçalves</title>

        <!-- <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />-->
        <!--<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />-->
        <g:layoutHead />
        <g:javascript library="application" />

        <script type="text/javascript"  src="${resource(dir:'js/bootstrap',file:'jquery.js')}"></script>
        <script type="text/javascript"  src="${resource(dir:'js/bootstrap',file:'bootstrap-dropdown.js')}"></script>
        <script type="text/javascript"  src="${resource(dir:'js/bootstrap',file:'application.js')}"></script>

        <script type="text/javascript"  src="${resource(dir:'js',file:'jquery-1.4.2.min.js')}"></script>
        <script type="text/javascript"  src="${resource(dir:'js',file:'jquery-ui-1.7.1.custom.min.js')}"></script>
        <script type="text/javascript"  src="${resource(dir:'js',file:'jquery.meio.mask.min.js')}"></script>
        <script type="text/javascript"  src="${resource(dir:'js',file:'jquery.simplemodal-1.3.js')}"></script>


        <link rel="stylesheet" href="${resource(dir:'css',file:'lytebox.css')}" />
        <script type="text/javascript"  src="${resource(dir:'js',file:'lytebox.js')}"></script>
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'print.css')}" media="print" />

        <link href="${resource(dir:'css',file:'bootstrap.css')}" rel="stylesheet">
        <link href="${resource(dir:'css',file:'datepicker.css')}" rel="stylesheet">

        <style>
            body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
            }
        </style>

        <link href="${resource(dir:'css',file:'bootstrap-responsive.css')}" rel="stylesheet">

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->


    </head>
    <body>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="${createLink(controller:'page',action:'admin')}">Erica Gonçalves</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><a href="${createLink(controller:'page',action:'admin')}">Início</a></li>
                            <li><a target="_blank" href="${createLink(controller:'page',action:'inicio')}">Ir para Site</a></li>
                            <li><a href="${createLink(controller:'usuario',action:'alterarSenha')}">Mudar Senha</a></li>
                            <li><a href="${createLink(controller:'usuario',action:'logout')}">Sair</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <div class="container">

            <g:layoutBody />

        </div>

    </body>
</html>