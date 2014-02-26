
<%@ page import="sisgo.Paciente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
        <title>Visualizar Cadastro</title>
    </head>
    <body>
        <div class="body">
            <div class="form">
                <g:if test="${flash.message}">
                    <div class="alert fade in">${flash.message}</div>
                </g:if>

                <h1>${fieldValue(bean: pacienteInstance, field: "nome")} - ${pacienteInstance.numeroPaciente}</h1>

                    <div class="controls controls-row">
                        <p class="fc2">
                            <label for="rg"><g:message code="paciente.rg.label" default="Rg" /></label>
                            <g:textField name="rg" readonly="readonly" class="span3" maxlength="14" value="${pacienteInstance?.rg}" />
                        </p>
                        <p class="fc2">
                            <label for="cpf"><g:message code="paciente.cpf.label" default="Cpf" /></label>
                            <g:textField readonly="readonly" name="cpf" class="span3" maxlength="14" value="${pacienteInstance?.cpf}" />
                        </p>
                    </div>

                <div class="controls controls-row">

                    <p class="fc2">
                        <label for="endereco"><g:message code="paciente.endereco.label" default="Endereco" /></label>
                        <g:textField name="endereco" class="span3" maxlength="180" value="${pacienteInstance?.endereco}" />
                    </p>
                    <p class="fc2">
                        <label for="cep"><g:message code="paciente.cep.label" default="CEP" /></label>
                        <g:textField name="cep" maxlength="14" class="span3" value="${pacienteInstance?.cep}" />
                    </p>
                </div>

                    <div class="controls controls-row">
                        <p class="fc2">
                            <label for="telResidencial"><g:message code="paciente.telResidencial.label" default="Tel Residencial" /></label>
                             <g:textField name="telResidencial" readonly="readonly" maxlength="14" class="span3" value="${pacienteInstance?.telResidencial}" />
                        </p>

                        <p class="fc2">
                             <label for="telCelular"><g:message code="paciente.telCelular.label" default="Tel Celular" /></label>
                             <g:textField name="telCelular" readonly="readonly" class="span3" maxlength="14" value="${pacienteInstance?.telCelular}" />
                        </p>
                    </div>

                    <div class="controls controls-row">
                        <p class="fc2">
                            <label for="telComercial"><g:message code="paciente.telComercial.label" default="Tel Comercial" /></label>
                            <g:textField name="telComercial" class="span3" maxlength="14" value="${pacienteInstance?.telComercial}" />
                        </p>
                        <p class="fc2">
                            <label for="sexo"><g:message code="paciente.sexo.label" default="Sexo" /></label>
                            <g:select class="select"  name="sexo" from="${pacienteInstance.constraints.sexo.inList}" value="${pacienteInstance?.sexo}" valueMessagePrefix="paciente.sexo"  />
                        </p>
                    </div>


                    <div class="controls controls-row">
                        <p class="fc2">
                            <label for="estCivil"><g:message code="paciente.estCivil.label" default="Est Civil" /></label>
                             <g:select name="estCivil" readonly="readonly" class="select" from="${pacienteInstance.constraints.estCivil.inList}" value="${pacienteInstance?.estCivil}" valueMessagePrefix="paciente.estCivil"  />
                        </p>

                        <p class="fc2">
                            <label for="profissao"><g:message code="paciente.profissao.label" default="Profissao" /></label>
                            <g:textField name="profissao" readonly="readonly" class="span3"  maxlength="70" value="${pacienteInstance?.profissao}" />
                        </p>
                    </div>

                <div class="controls controls-row">

                    <p class="fc2">
                        <label for="email"><g:message code="paciente.email.label" default="Email" /></label>
                        <g:textField  name="email" maxlength="75" value="${pacienteInstance?.email}"  class="span3"  />
                    </p>

                </div>

                <div class="controls controls-row">
                    <p class="fc2">
                        <label for="convenio"><g:message code="paciente.convenio.label" default="Convênio" /></label>
                        <g:textField  class="span3"  name="convenio" maxlength="75" value="${pacienteInstance?.convenio}" />
                    </p>
                    <p class="fc2">
                        <label for="indicacao"><g:message code="paciente.indicacao.label" default="Quem indicou?" /></label>
                        <g:textField name="indicacao"  class="span3"  maxlength="70" value="${pacienteInstance?.indicacao}" />
                    </p>
                </div>

                <div class="controls controls-row">
                    <p class="fc1">
                        <label for="aniversario">Data Aniversário</label>
                        <g:select name="dia" readonly="readonly"  class="span1" from="${pacienteInstance.constraints.dia.inList}" value="${pacienteInstance?.dia}" valueMessagePrefix="paciente.dia"  />
                        <g:select name="mes" readonly="readonly"  class="span2" from="${pacienteInstance.constraints.mes.inList}" value="${pacienteInstance?.mes}" valueMessagePrefix="paciente.mes"  />
                        <g:select name="ano" readonly="readonly" class="span1" from="${pacienteInstance.constraints.ano.inList}" value="${pacienteInstance?.ano}" valueMessagePrefix="paciente.ano"  />
                    </p>

                </div>


                <div class="controls">
                    <label for="obs"><g:message code="paciente.obs.label" default="Observação" /></label>
                    <textarea name="obs" class="fc1" maxlength="255" id="obs">${pacienteInstance?.obs}</textarea>
                </div>

                <div class="fc2">
                    <h3>Histórico Anamnese</h3>
                    <ul>
                        <g:each in="${pacienteInstance?.anamnese?}" var="a">
                            <li>
                                <g:link controller="anamnese" action="show" id="${a.id}">Anamnese cadastrado: <g:formatDate  format="dd-MM-yyyy" date="${a?.ultimaVisita}" /></g:link></li>
                        </g:each>
                    </ul>
                </div>
            </div>


            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${pacienteInstance?.id}" />
                    <g:actionSubmit class="btn btn-primary" action="edit" value="Atualizar" />
                    <g:link controller="anamnese" action="create" class="btn btn-primary" params="['paciente.id': pacienteInstance?.id]">Adicionar Anamnese</g:link>
                    <g:link controller="consulta" action="create" class="btn btn-primary" params="['paciente.id': pacienteInstance?.id]">Adicionar Consulta</g:link>
                    <!--<g:link controller="anamnese" action="create" params="['paciente.id': pacienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'anamnese.label', default: 'Anamnese')])}</g:link>-->
                </g:form>
            </div>
        </div>
    </body>
</html>
