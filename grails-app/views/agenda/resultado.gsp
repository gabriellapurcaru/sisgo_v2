
<%@ page import="sisgo.Paciente" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
    <title>Listagem de Pacientes</title>
</head>
<body>

<div class="form">

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <h1>Resultado Pesquisa</h1>
    <div class="list">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${pacientes}" status="i" var="pacienteInstance">
                <tr>
                    <td>${fieldValue(bean: pacienteInstance, field: "numeroPaciente")}</td>
                    <td>${fieldValue(bean: pacienteInstance, field: "nome")}</td>
                    <td>
                        <g:link class="btn btn-mini" action="show" id="${pacienteInstance.id}">Dados Paciente</g:link>
                        <g:link controller="consulta" action="show" class="btn btn-mini" params="['paciente.id': pacienteInstance?.id]">Anamnese</g:link>
                        <g:link controller="consulta" action="create" class="btn btn-mini" params="['paciente.id': pacienteInstance?.id]">Adicionar Consulta</g:link>
                        <g:link controller="consulta" action="list" class="btn btn-mini" params="['paciente.id': pacienteInstance?.id]">listar Consulta</g:link>

                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
