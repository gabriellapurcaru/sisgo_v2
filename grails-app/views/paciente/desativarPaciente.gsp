
<%@ page import="sisgo.Paciente" %>
<html xmlns:g="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
    <title>Listagem de Pacientes</title>
</head>
<body>
<div class="form">

    <g:form action="saveDesativarPaciente" method="post" >
        <input class="btn btn-mini" type="submit" value="Salvar"/>
    </g:form>
</div>
</body>
</html>
