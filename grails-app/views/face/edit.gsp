

<%@ page import="sisgo.Face" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'face.label', default: 'Face')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${faceInstance}">
            <div class="errors">
                <g:renderErrors bean="${faceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${faceInstance?.id}" />
                <g:hiddenField name="version" value="${faceInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="face"><g:message code="face.face.label" default="Face" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faceInstance, field: 'face', 'errors')}">
                                    <g:textField name="face" value="${faceInstance?.face}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="planosTratamento"><g:message code="face.planosTratamento.label" default="Planos Tratamento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: faceInstance, field: 'planosTratamento', 'errors')}">
                                    
<ul>
<g:each in="${faceInstance?.planosTratamento?}" var="p">
    <li><g:link controller="planoTratamento" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="planoTratamento" action="create" params="['face.id': faceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'planoTratamento.label', default: 'PlanoTratamento')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
