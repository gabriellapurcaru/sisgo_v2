
<%@ page import="sisgo.PlanoOdontologico" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'planoOdontologico.label', default: 'PlanoOdontologico')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li><g:link controller="page" action="admin">Início</g:link><span class="divider">/</span></li>
                <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li
                <li class="active">Planos Odontológicos</li>
            </ul>
            <h1>Visualizar Plano Odontológico</h1>
            <g:if test="${flash.message}">
            <div class="alert alert-block">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table class="table table-bordered">
                    <tbody>

                        <tr class="prop">
                            <th valign="top" class="name"><g:message code="planoOdontologico.numeroPlano.label" default="Código" /></th>

                            <td valign="top" class="value">${fieldValue(bean: planoOdontologicoInstance, field: "numeroPlano")}</td>

                        </tr>


                        <tr class="prop">
                            <th valign="top" class="name"><g:message code="planoOdontologico.nome.label" default="Nome" /></th>
                            
                            <td valign="top" class="value">${fieldValue(bean: planoOdontologicoInstance, field: "nome")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <th valign="top" class="name"><g:message code="planoOdontologico.valorPlano.label" default="Valor Plano" /></th>
                            
                            <td valign="top" class="value">${fieldValue(bean: planoOdontologicoInstance, field: "valorPlano")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <th valign="top" class="name"><g:message code="planoOdontologico.tipoPlano.label" default="Tipo Plano" /></th>
                            
                            <td valign="top" class="value">${fieldValue(bean: planoOdontologicoInstance, field: "tipoPlano")}</td>
                            
                        </tr>
                    

                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${planoOdontologicoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>


            <div class="nav">
                <span class="menuButton"><g:link class="btn btn-primary" action="list">Listagem Planos Odontológicos</g:link></span>
            </div>
        </div>
    </body>
</html>
