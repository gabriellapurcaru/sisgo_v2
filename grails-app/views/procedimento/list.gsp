
<%@ page import="sisgo.Procedimento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'procedimento.label', default: 'Procedimento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <g:link class="btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="alert alert-warning" role="status">${flash.message}</div>
            </g:if>
            <div class="form">
                <g:form action="resultado" method="GET" >
                    <div class="input-append">
                        <label>Nome do Procedimento:</label><input class="span2" id="nome" name="nome" size="30" type="text"><input  class="btn" type="submit" value="Pesquisar" />
                    </div>
                </g:form>


                <h1><g:message code="default.list.label" args="[entityName]" /></h1>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th><g:message code="procedimento.especialidade.label" default="Especialidade" /></th>
                            <g:sortableColumn property="nome" title="${message(code: 'procedimento.nome.label', default: 'Procedimento')}" />
                            <g:sortableColumn property="valor" title="${message(code: 'procedimento.valor.label', default: 'Valor')}" />
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${procedimentoInstanceList}" status="i" var="procedimentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${procedimentoInstance?.especialidade?.nome}</td>
                            <td>${fieldValue(bean: procedimentoInstance, field: "nome")}</td>
                            <td>R$${fieldValue(bean: procedimentoInstance, field: "valor")}</td>
                            <td>
                                <g:link action="show" class="btn btn-mini" id="${procedimentoInstance.id}">Visualizar</g:link>
                                <span class="button"><g:link  id="${procedimentoInstance.id}" class="btn btn-mini" action="deleta" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                              onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >Deletar</g:link></span>

                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${procedimentoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
