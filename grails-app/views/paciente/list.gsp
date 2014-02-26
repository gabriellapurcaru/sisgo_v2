
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
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:form action="resultado" method="GET" >
                <div class="input-append">
                    <label>Código do Paciente:</label><input class="span2" id="numeroPaciente" name="numeroPaciente" size="8" type="text"><input  class="btn" type="submit" value="Pesquisar" />
                </div>
            </g:form>
            <g:form action="resultado" method="GET" >
                <div class="input-append">
                    <label>Nome do Paciente:</label><input class="span2" id="nomePaciente" name="nomePaciente" size="30" type="text"><input  class="btn" type="submit" value="Pesquisar" />
                </div>
            </g:form>

            <h1>Pacientes</h1>


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
                    <g:each in="${pacienteInstanceList}" status="i" var="pacienteInstance">
                        <g:if test="${!status}">

                        <tr>
                            <td>${fieldValue(bean: pacienteInstance, field: "numeroPaciente")}</td>
                            <td>${fieldValue(bean: pacienteInstance, field: "nome")} ${pacienteInstance.ativo}</td>
                            <td>
                                <g:link class="btn btn-mini" action="show" id="${pacienteInstance.id}">Dados Paciente</g:link>
                                <g:link controller="consulta" action="show" class="btn btn-mini" params="['paciente.id': pacienteInstance?.id]">Anamnese</g:link>
                                <g:link controller="consulta" action="create" class="btn btn-mini" params="['paciente.id': pacienteInstance?.id]">Adicionar Consulta</g:link>
                                <g:link controller="consulta" action="list" class="btn btn-mini" params="['paciente.id': pacienteInstance?.id]">listar Consulta</g:link>
                                <g:link controller="agenda" action="list" class="btn btn-mini" params="['paciente.id': pacienteInstance?.id]">Retorno</g:link>
                                <g:if test="${!pacienteInstance.ativo}">
                                    <span class="label label-info">Desativado</span>
                                </g:if>
                                <g:if test="${pacienteInstance.ativo}">
                                    <g:link  class="btn btn-mini" action="desativar" id="${pacienteInstance.id}">Desativar Paciente</g:link>
                                </g:if>
                            </td>
                        </tr>
                        </g:if>

                    </g:each>
                    </tbody>
                </table>
                <g:link class="btn btn-primary" action="create">Cadastrar Paciente</g:link>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pacienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
