

<%@ page import="sisgo.VincularClientePlano" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vincularClientePlano.label', default: 'VincularClientePlano')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Vincular Cliente a Plano</h1>

            <g:if test="${flash.message}">
                <div class="alert fade in">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${vincularClientePlanoInstance}">
            <div class="alert fade in">
                <g:renderErrors bean="${vincularClientePlanoInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:form action="save" >
                <g:hiddenField name="cliente.id" value="${params.cliente.id}" />

                <div class="dialog">
                    <table class="table table-bordered">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cliente"><g:message code="vincularClientePlano.cliente.label" default="Cliente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vincularClientePlanoInstance, field: 'cliente', 'errors')}">
                                    <label>${vincularClientePlanoInstance?.cliente?.nome}</label>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataInclusao"><g:message code="vincularClientePlano.dataInclusao.label" default="Data Inclusão" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vincularClientePlanoInstance, field: 'dataInclusao', 'errors')}">
                                    <g:datePicker name="dataInclusao" precision="day" value="${vincularClientePlanoInstance?.dataInclusao}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataPagamento"><g:message code="vincularClientePlano.dataPagamento.label" default="Data Pagamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vincularClientePlanoInstance, field: 'dataPagamento', 'errors')}">
                                    <g:select name="dia" class="span2" from="${vincularClientePlanoInstance.constraints.dia.inList}" value="${vincularClientePlanoInstance?.dia}" valueMessagePrefix="vincularClientePlano.dia"   noSelection="['':'- Selecione -']"/>
                                    <g:select name="mes" class="span2" from="${vincularClientePlanoInstance.constraints.mes.inList}" value="${vincularClientePlanoInstance?.mes}" valueMessagePrefix="vincularClientePlano.mes"   noSelection="['':'- Selecione -']"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="periodoContratual"><g:message code="vincularClientePlano.periodoContratual.label" default="Periodo Contratual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vincularClientePlanoInstance, field: 'periodoContratual', 'errors')}">
                                    <g:select class="span3" name="periodoContratual" id="periodoContratual" from="${['MENSAL','ANUAL']}" value="${fieldValue(bean:planoOdontologico,field:'planoOdontologicoInstance')}" noSelection="['':'-Selecione uma opção -']"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="planoOdontologico"><g:message code="vincularClientePlano.planoOdontologico.label" default="Plano Odontológico" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vincularClientePlanoInstance, field: 'planoOdontologico', 'errors')}">
                                    <g:select name="planoOdontologico.id" from="${sisgo.PlanoOdontologico.list()}" optionKey="id" optionValue="nome" value="${vincularClientePlanoInstance?.planoOdontologico?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="btn" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
