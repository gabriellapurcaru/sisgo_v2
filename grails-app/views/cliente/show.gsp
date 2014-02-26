
<%@ page import="sisgo.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:link class="btn btn-primary" action="list">Listagem Clientes</g:link>

            <h1>Dados Cliente</h1>
            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>


            <div class="controls">
                <label for="nome"><g:message code="paciente.nome.label" default="Nome" /></label>
                <g:textField  class="span6" name="nome" maxlength="180" value="${clienteInstance?.nome}"/>
            </div>

            <div class="controls controls-row">
                <p class="fc2">
                    <label for="rg"><g:message code="paciente.rg.label" default="Rg" /></label>
                    <g:textField name="rg" class="span3" maxlength="14" value="${clienteInstance?.rg}" />
                </p>
                <p class="fc2">
                    <label for="cpf"><g:message code="paciente.cpf.label" default="Cpf" /></label>
                    <g:textField name="cpf" class="span3" maxlength="14" value="${clienteInstance?.cpf}" />
                </p>
            </div>

            <div class="controls controls-row">
                <p class="fc2">
                    <label for="endereco"><g:message code="paciente.endereco.label" default="Endereço" /></label>
                    <g:textField name="endereco" class="span6" maxlength="180" value="${clienteInstance?.endereco}" />
                </p>

            </div>

            <div class="controls controls-row">
                <p class="fc2">
                    <label for="telResidencial"><g:message code="paciente.telResidencial.label" default="Tel Residencial" /></label>
                    <g:textField name="telResidencial" maxlength="14" class="span3" value="${clienteInstance?.telResidencial}" />
                </p>

                <p class="fc2">
                    <label for="telCelular"><g:message code="paciente.telCelular.label" default="Tel Celular" /></label>
                    <g:textField name="telCelular" class="span3" maxlength="14" value="${clienteInstance?.telCelular}" />
                </p>
            </div>

            <div class="controls controls-row">
                <p class="fc2">
                    <label for="telComercial"><g:message code="paciente.telComercial.label" default="Tel Comercial" /></label>
                    <g:textField name="telComercial" class="span3" maxlength="14" value="${clienteInstance?.telComercial}" />
                </p>
                <p class="fc2">
                    <label for="municipio"><g:message code="paciente.municipio.label" default="Municipio" /></label>
                    <g:select name="municipio" from="${clienteInstance.constraints.municipio.inList}" value="${clienteInstance?.municipio}" valueMessagePrefix="paciente.municipio"  />
                </p>
            </div>



            <div class="controls controls-row">
                <p class="fc2">
                    <label for="email"><g:message code="paciente.email.label" default="Email" /></label>
                    <g:textField  name="email" maxlength="75" value="${clienteInstance?.email}"  class="span3"  />
                </p>

            </div>
            <div class="controls controls-row">
                <p class="fc0">
                    <label for="aniversario">Data Aniversário</label>
                    <g:select name="dia" class="span2" from="${clienteInstance.constraints.dia.inList}" value="${clienteInstance?.dia}" valueMessagePrefix="paciente.dia"   noSelection="['':'- Selecione -']"/>
                    <g:select name="mes" class="span2" from="${clienteInstance.constraints.mes.inList}" value="${clienteInstance?.mes}" valueMessagePrefix="paciente.mes"   noSelection="['':'- Selecione -']"/>
                    <g:select name="ano" class="span3" from="${clienteInstance.constraints.ano.inList}" value="${clienteInstance?.ano}" valueMessagePrefix="paciente.ano"   noSelection="['':'- Selecione -']"/>
                </p>

            </div>

            <div class="controls">
                <label for="obs"><g:message code="cliente.obs.label" default="Observação" /></label>
                <textarea name="obs" class="fc1" maxlength="255" id="obs">${clienteInstance?.obs}</textarea>
            </div>


            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${clienteInstance?.id}" />
                    <span class="button"><g:actionSubmit class="btn" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
