
<%@ page import="sisgo.VincularClientePlano" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vincularClientePlano.label', default: 'VincularClientePlano')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1>Visualizar </h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vincularClientePlano.cliente.label" default="Cliente" /></td>
                            
                            <td valign="top" class="value"><g:link controller="cliente" action="show" id="${vincularClientePlanoInstance?.cliente?.id}">${vincularClientePlanoInstance?.cliente?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vincularClientePlano.dataInclusao.label" default="Data Inclusao" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${vincularClientePlanoInstance?.dataInclusao}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vincularClientePlano.dataPagamento.label" default="Data Pagamento" /></td>
                            
                            <td valign="top" class="value">
                                <label>${vincularClientePlanoInstance?.dia} - ${vincularClientePlanoInstance?.mes}</label>
                            </td>
                            
                        </tr>
                    


                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vincularClientePlano.periodoContratual.label" default="Periodo Contratual" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: vincularClientePlanoInstance, field: "periodoContratual")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vincularClientePlano.planoOdontologico.label" default="Plano Odontologico" /></td>
                            
                            <td valign="top" class="value"><g:link controller="planoOdontologico" action="show" id="${vincularClientePlanoInstance?.planoOdontologico?.id}">${vincularClientePlanoInstance?.planoOdontologico?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${vincularClientePlanoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
