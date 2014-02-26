

<%@ page import="sisgo.Consulta" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'consulta.label', default: 'Consulta')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${consultaInstance}">
            <div class="alert alert-block alert-error fade in">
                <g:renderErrors bean="${consultaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <g:hiddenField name="paciente.id" value="${params.paciente.id}" />

                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataConsulta"><g:message code="consulta.dataConsulta.label" default="Data Consulta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: consultaInstance, field: 'dataConsulta', 'errors')}">
                                    <g:datePicker class="span2" name="dataConsulta" precision="day" value="${consultaInstance?.dataConsulta}"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="motivo"><g:message code="consulta.motivo.label" default="Motivo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: consultaInstance, field: 'motivo', 'errors')}">
                                    <g:textArea name="motivo" value="${consultaInstance?.motivo}" rows="3" cols="40"/>
                                </td>
                            </tr>

                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <g:submitButton name="create" class="btn btn-mini"  value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </g:form>
        </div>
    </body>
</html>
