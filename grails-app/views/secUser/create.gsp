

<%@ page import="sisgo.auth.SecUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'secUser.label', default: 'SecUser')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${secUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${secUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="userTenantId"><g:message code="secUser.userTenantId.label" default="Clinica" /></label>
                            </td>
                            <td valign="top">
                                <g:select id="userTenantId" name="userTenantId" value="${fieldValue(bean: secUserInstance, field: 'userTenantId')}"
                                          from="${sisgo.Clinica.list()}"
                                          optionKey="id"
                                          optionValue="name"
                                        />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="username"><g:message code="secUser.username.label" default="Username" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: secUserInstance, field: 'username', 'errors')}">
                                <g:textField name="username" value="${secUserInstance?.username}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="password"><g:message code="secUser.password.label" default="Password" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: secUserInstance, field: 'password', 'errors')}">
                                <g:textField name="password" value="${secUserInstance?.password}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="email"><g:message code="secUser.email.label" default="Email" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: secUserInstance, field: 'email', 'errors')}">
                                <g:textField name="email" value="${secUserInstance?.email}" />
                            </td>
                        </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
