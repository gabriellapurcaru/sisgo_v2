
<%@ page import="sisgo.Agenda" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'agenda.label', default: 'Agenda')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <link href="${resource(dir:'css',file:'prettify.css')}" rel="stylesheet">
        <link href="${resource(dir:'css',file:'datepicker.css')}" rel="stylesheet">

    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">

                <g:if test="${p}">
                    <h3>Retorno(s) de ${p?.nome}(${p?.numeroPaciente})</h3>
                    <div class="nav">
                        <span class="menuButton"><g:link class="btn btn-primary" action="create" id="${p.id}">Novo Retorno</g:link></span>
                    </div>
                </g:if>
                <g:else>
                    <h3><g:message code="default.list.label" args="[entityName]" /></h3>
                    <div class="nav">
                        <span class="menuButton"><g:link class="btn btn-primary" action="create">Novo Retorno</g:link></span>
                    </div>
                    <div class="well">
                        <g:form action="list" method="GET" >
                            <div class="input-append date" id="datepicker" data-date="${hoje}" data-date-format="dd-mm-yyyy">
                                <input name="dia" size="9" type="text" value="">
                                <span class="add-on"><i class="icon-th"></i></span>   <button type="submit" class="btn">Pesquisar por dia</button>
                            </div>
                        </g:form>

                        <g:form action="list" method="GET" >
                            <div class="input-append date" id="dpMonths" data-date="${hoje}" data-date-format="mm-yyyy" data-date-viewmode="years" data-date-minviewmode="months">
                                <input name="mes" class="span2" size="9" type="text" value="">
                                <span class="add-on"><i class="icon-calendar"></i></span> <button type="submit" class="btn">Pesquisar por mes</button>
                            </div>
                        </g:form>
                    </div>
                </g:else>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <g:sortableColumn property="dataRetorno" title="${message(code: 'agenda.dataRetorno.label', default: 'Data Retorno')}" />
                            <th><g:message code="agenda.paciente.label" default="Paciente" /></th>
                            <g:sortableColumn property="retorno" title="${message(code: 'agenda.retorno.label', default: 'Motivo')}" />
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${agendaInstanceList}" status="i" var="agendaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <g:if test="${agendaInstance?.paciente?.ativo}">
                            <td><g:formatDate date="${agendaInstance.dataRetorno}" /></td>
                            <td>${agendaInstance?.paciente?.nome}</td>
                            <td>${fieldValue(bean: agendaInstance, field: "retorno")} </td>
                            <td>
                                <g:form>
                                    <g:hiddenField name="id" value="${agendaInstance?.id}" />
                                    <span class="button"><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                                </g:form>
                            </td>
                        </g:if>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:if test="!params.paciente.id">
                <div class="paginateButtons">
                    <g:paginate total="${agendaInstanceTotal}" />
                </div>
            </g:if>
        </div>

        <g:javascript src="jquery.js" />
        <g:javascript src="bootstrap/bootstrap-datepicker.js" />

    <script type="text/javascript">
        $(function(){

        $('#datepicker').datepicker();
        $('#dpMonths').datepicker();

        });
    </script>

    </body>
</html>
