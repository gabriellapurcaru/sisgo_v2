
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
    <h4>Pesquisa Aniversariante</h4>
    <g:form action="pesquisaGeral" method="GET" >
        <div class="input-append">
            <label>Data início:</label>
            <input class="span2" type="text" id="dataInicio" name="dataInicio"/>
            <label>Data Fim:</label> <input class="span2" type="text" id="dataFim" name="dataFim"/>
            <input  class="btn" type="submit" value="Pesquisar" />
        </div>
    </g:form>
    <h1>Resultado Pesquisa</h1>
    <%if(pacientesTotal){%>
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong> ${pacientesTotal}</strong> Paciente(s) Encontrado(s)
    </div>
    <%}%>


    <div class="list">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Código</th>
                <th>Nome</th>
                <th>Data
                    <Nascimento></Nascimento></th>
                <th>Ações</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${pacientes}" status="i" var="pacienteInstance">
                <tr>
                    <td>${fieldValue(bean: pacienteInstance, field: "numeroPaciente")}</td>
                    <td>${fieldValue(bean: pacienteInstance, field: "nome")}</td>
                    <td><g:formatDate format="dd-MM-yyyy" date="${pacienteInstance?.dataNascimento}"/></td>
                    <td>
                        <g:link class="btn btn-mini" action="show" id="${pacienteInstance.id}">Dados Paciente</g:link>

                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
