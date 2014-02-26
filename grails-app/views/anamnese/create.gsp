

<%@ page import="sisgo.Anamnese" %>
<html xmlns:g="http://www.w3.org/1999/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anamnese.label', default: 'Anamnese')}" />
        <title>Cadastrar Anamnese</title>
    </head>
    <body>
        <div class="nav">
            <div id="contents">
                <span class="menuButton"><g:link class="btn btn-primary" controller="page" action="admin">Painel</g:link></span>
            </div>
        </div>

        <div class="form">

            <g:if test="${flash.message}">
                <div class="alert fade in">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${anamneseInstance}">
                <div class="alert alert-block alert-error fade in">
                    <g:renderErrors bean="${anamneseInstance}" as="list" />
                </div>
            </g:hasErrors>

            <g:form action="save" >
                <div class="dialog">
                    <g:hiddenField name="paciente.id" value="${pacienteInstance?.id}" />

                <h3>Anamnese da Paciente ${pacienteInstance?.nome}</h3>

                <div class="fc1">
                    <label class="anm">Problemas de Saúde</label>
                    <div class="set">
                        <g:checkBox name="problemaSaude" value="${anamneseInstance?.problemaSaude}" />
                        <span for="problemaSaude"><g:message code="anamnese.problemaSaude.label" default="Nenhum" /></span>
                    </div>

                    <div class="ps3">
                        <div class="sets">
                            <g:checkBox name="cardiaco" value="${anamneseInstance?.cardiaco}" />
                            <span for="cardiaco"><g:message code="anamnese.cardiaco.label" default="Cardiaco" /></span>
                        </div>

                        <div class="sets">
                            <g:checkBox name="diabetico" value="${anamneseInstance?.diabetico}" />
                            <span  for="diabetico"><g:message code="anamnese.diabetico.label" default="Diabetico" /></span>
                        </div>

                        <div class="sets">
                            <g:checkBox name="hepatite" value="${anamneseInstance?.hepatite}" />
                            <span for="hepatite"><g:message code="anamnese.hepatite.label" default="Hepatite" /></span>
                        </div>
                    </div>

                    <div class="ps3">
                        <div class="sets">
                            <g:checkBox name="anemia" value="${anamneseInstance?.anemia}" />
                            <span  for="anemia"><g:message code="anamnese.anemia.label" default="Anemia" /></span>
                        </div>
                        <div class="sets">
                            <g:checkBox name="asmatico" value="${anamneseInstance?.asmatico}" />
                            <span  for="asmatico"><g:message code="anamnese.asmatico.label" default="Asmatico" /></span>
                        </div>
                        <div class="sets">
                            <g:checkBox name="disturbioHormonais" value="${anamneseInstance?.disturbioHormonais}" />
                            <span  for="disturbioHormonais"><g:message code="anamnese.disturbioHormonais.label" default="Disturbio Hormonais" /></span>
                        </div>
                    </div>

                    <div class="ps3">
                    <div class="sets">
                        <g:checkBox name="problemaRenal" value="${anamneseInstance?.problemaRenal}" />
                        <span  for="problemaRenal"><g:message code="anamnese.problemaRenal.label" default="Problema Renal" /></span>
                    </div>
                    <div class="sets">
                        <g:checkBox name="alergia" value="${anamneseInstance?.alergia}" />
                        <span for="alergia"><g:message code="anamnese.alergia.label" default="Alergia" /></span>
                    </div>
                    <div class="sets">
                        <g:checkBox name="gestante" value="${anamneseInstance?.gestante}" />
                        <span for="gestante"><g:message code="anamnese.gestante.label" default="Gestante" /></span>
                    </div>
                    </div>

                    <div class="ps1">
                        <div class="set">
                        <div class="set">
                            <g:checkBox name="hipertenso" value="${anamneseInstance?.hipertenso}" />
                            <span for="hipertenso"><g:message code="anamnese.hipertenso.label" default="Hipertenso" /></span>

                            <g:textField name="hipertensaoDescricao" maxlength="180" value="${anamneseInstance?.hipertensaoDescricao}"/>
                        </div>
                     </div>

                    <div class="ps1">
                        <div class="set">
                            <g:checkBox name="dst" value="${anamneseInstance?.dst}" />
                            <span for="dst"><g:message code="anamnese.dst.label" default="DST" /></span>
                            <g:textField  name="dstDescricao" maxlength="180" value="${anamneseInstance?.dstDescricao}"/>
                        </div>
                    </div>


                    <div class="ps1">
                        <g:checkBox name="outro" value="${anamneseInstance?.outro}" />
                        <span for="outro"><g:message code="anamnese.outro.label" default="Outro" /></span>

                        <g:textField  name="outroDescricao" maxlength="180" value="${anamneseInstance?.outroDescricao}"/>
                    </div>
                </div>

                <div class="ps1">
                    <p>
                        <label for="historicoFamiliar"><g:message code="anamnese.historicoFamiliar.label" default="Histórico Familiar" /></label>
                        <g:textArea rows="3"  class="fc1" name="historicoFamiliar" maxlength="180" value="${anamneseInstance?.historicoFamiliar}"/>
                    </p>
                </div>

                    <div class="ps1">
                        <label class="anm">Medicacão</label>
                        <div class="set">
                            <g:checkBox name="medicacao" value="${anamneseInstance?.medicacao}" />
                            <span for="medicacao"><g:message code="anamnese.medicacao.label" default="Nenhuma" /></span>
                        </div>

                        <div class="set">
                            <label for="medicacaoTipo"><g:message code="anamnese.medicacaoTipo.label" default="Sim, Qual?" /></label>
                            <g:textArea rows="3" class="fc1" name="medicacaoTipo" maxlength="180" value="${anamneseInstance?.medicacaoTipo}"/>
                        </div>
                    </div>

                    <div class="ps1">
                        <label class="anm">Hábito</label>
                        <div class="set">
                            <g:checkBox name="habito" value="${anamneseInstance?.habito}" />
                            <span for="habito"><g:message code="anamnese.habito.label" default="Nenhum" /></span>
                        </div>
                        <div class="set">
                            <label for="habitoTipo"><g:message code="anamnese.habitoTipo.label" default="Sim, Qual?" /></label>
                            <g:textField class="fc1" name="habitoTipo" maxlength="180" value="${anamneseInstance?.habitoTipo}"/>
                        </div>
                    </div>

                    <div class="ps1">
                        <label class="anm">Problema com dentista em tratamentos anteriores</label>

                        <div class="set">
                            <g:checkBox name="problemaAnterior" value="${anamneseInstance?.problemaAnterior}" />
                            <span for="problemaAnterior"><g:message code="anamnese.problemaAnterior.label" default="Não" /></span>
                        </div>

                         <div class="ps1">
                             <div class="sets">
                                 <g:checkBox name="anestesia" value="${anamneseInstance?.anestesia}" />
                                 <span for="anestesia"><g:message code="anamnese.anestesia.label" default="Anestesia" /></span>
                             </div>
                             <div class="sets">
                                <g:checkBox name="extracao" value="${anamneseInstance?.extracao}" />
                                <span for="extracao"><g:message code="anamnese.extracao.label" default="Extracao" /></span>
                             </div>
                             <div class="sets">
                                 <g:checkBox name="hemorragia" value="${anamneseInstance?.hemorragia}" />
                                <span for="hemorragia"><g:message code="anamnese.hemorragia.label" default="Hemorragia" /></span>
                             </div>
                         </div>
                        <div class="ps1">
                             <div class="sets">
                                <g:checkBox name="desmaios" value="${anamneseInstance?.desmaios}" />
                                <span for="desmaios"><g:message code="anamnese.desmaios.label" default="Desmaios" /></span>
                             </div>

                            <g:checkBox name="outros" value="${anamneseInstance?.outros}" />
                            <span for="outros"><g:message code="anamnese.outros.label" default="Outros" /></span>

                            <span for="outrosDescricao"><g:message code="anamnese.outrosDescricao.label" default="" /></span>
                            <g:textField  name="outrosDescricao" maxlength="180" value="${anamneseInstance?.outrosDescricao}"/>
                        </div>

                        <div class="ps3">

                        </div>
                    </div>

                    <div class="controls">
                        <label class="anm" for="consideracao"><g:message code="anamnese.consideracao.label" default="Considerações" /></label>
                        <g:textArea rows="3" class="fc1" name="consideracao" maxlength="180" value="${anamneseInstance?.consideracao}"/>
                    </div>


                </div>
                <div class="buttons">
                    <g:submitButton name="create" class="btn" value="Cadastrar" />
                </div>
            </g:form>
        </div>
    </body>
</html>
