
<%@ page import="sisgo.Anamnese" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'anamnese.label', default: 'Anamnese')}" />
        <title>Visualizar Cadastro Anamnese</title>
    </head>

    <body>
        <div class="nav">
            <div id="contents">
                <g:link class="btn btn-primary" controller="page" action="admin">Painel</g:link>
                <g:link class="btn btn-primary" controller="paciente" action="list">Listar Pacientes</g:link>
                <g:link controller="paciente" class="btn btn-primary" action="show" id="${anamneseInstance?.paciente.id}"><b>Ver Paciente</b></g:link>
            </div>
        </div>

        <div class="body">
        <div class="form">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <h1>Visualizando Anamnese</h1>

                <div class="controls">
                    <label>Problemas de Saúde</label>
                    <div class="set">
                        <g:checkBox readonly="readonly" name="problemaSaude" value="${anamneseInstance?.problemaSaude}" />
                        <span for="problemaSaude"><g:message code="anamnese.problemaSaude.label" default="Nenhum" /></span>
                    </div>


                    <div class="ps3">
                        <%if(anamneseInstance?.cardiaco){%>
                        <div class="sets">
                            <g:checkBox readonly="readonly" name="cardiaco" value="${anamneseInstance?.cardiaco}" />
                            <span for="cardiaco"><g:message code="anamnese.cardiaco.label" default="Cardiaco" /></span>
                        </div>
                        <%}%>
                        <%if(anamneseInstance?.diabetico){%>
                        <div class="sets">
                            <g:checkBox readonly="readonly" name="diabetico" value="${anamneseInstance?.diabetico}" />
                            <span  for="diabetico"><g:message code="anamnese.diabetico.label" default="Diabetico" /></span>
                        </div>
                        <%}%>
                        <%if(anamneseInstance?.hepatite){%>
                        <div class="sets">
                            <g:checkBox readonly="readonly" name="hepatite" value="${anamneseInstance?.hepatite}" />
                            <span for="hepatite"><g:message code="anamnese.hepatite.label" default="Hepatite" /></span>
                        </div>
                        <%}%>
                    </div>

                    <div class="ps3">
                        <%if(anamneseInstance?.anemia){%>
                        <div class="sets">
                            <g:checkBox readonly="readonly" name="anemia" value="${anamneseInstance?.anemia}" />
                            <span  for="anemia"><g:message code="anamnese.anemia.label" default="Anemia" /></span>
                        </div>
                        <%}%>
                        <%if(anamneseInstance?.asmatico){%>
                        <div class="sets">
                            <g:checkBox readonly="readonly"  name="asmatico" value="${anamneseInstance?.asmatico}" />
                            <span  for="asmatico"><g:message code="anamnese.asmatico.label" default="Asmatico" /></span>
                        </div>
                        <%}%>
                        <%if(anamneseInstance?.disturbioHormonais){%>
                        <div class="sets">
                            <g:checkBox readonly="readonly"  name="disturbioHormonais" value="${anamneseInstance?.disturbioHormonais}" />
                            <span  for="disturbioHormonais"><g:message code="anamnese.disturbioHormonais.label" default="Disturbio Hormonais" /></span>
                        </div>
                        <%}%>

                    </div>

                    <div class="ps3">
                    <%if(anamneseInstance?.problemaRenal){%>
                    <div class="sets">
                        <g:checkBox readonly="readonly"  name="problemaRenal" value="${anamneseInstance?.problemaRenal}" />
                        <span  for="problemaRenal"><g:message code="anamnese.problemaRenal.label" default="Problema Renal" /></span>
                    </div><%}%>
                    <%if(anamneseInstance?.alergia){%>
                    <div class="sets">
                        <g:checkBox readonly="readonly"  name="alergia" value="${anamneseInstance?.alergia}" />
                        <span for="alergia"><g:message code="anamnese.alergia.label" default="Alergia" /></span>
                    </div><%}%>
                    <%if(anamneseInstance?.gestante){%>
                    <div class="sets">
                        <g:checkBox readonly="readonly"  name="gestante" value="${anamneseInstance?.gestante}" />
                        <span for="gestante"><g:message code="anamnese.gestante.label" default="Gestante" /></span>
                    </div>
                    <%}%>
                    </div>

                    <div class="ps1">
                    <%if(anamneseInstance?.hipertenso){%>
                    <div class="set">
                        <div class="set">
                            <g:checkBox readonly="readonly"  name="hipertenso" value="${anamneseInstance?.hipertenso}" />
                            <span for="hipertenso"><g:message code="anamnese.hipertenso.label" default="Hipertenso" /></span>
                        </div>
                        <div class="set">
                            <label for="hipertensaoDescricao"><g:message code="anamnese.hipertensaoDescricao.label" default="Qual?" /></label>
                            <g:textField class="fc1" readonly="readonly"  name="hipertensaoDescricao" maxlength="180" value="${anamneseInstance?.hipertensaoDescricao}"/>
                        </div>
                     </div>
                    <%}%>
                    <%if(anamneseInstance?.dst){%>
                    <div class="ps1">
                        <div class="set">
                            <g:checkBox name="dst" readonly="readonly"  value="${anamneseInstance?.dst}" />
                            <span for="dst"><g:message code="anamnese.dst.label" default="DST" /></span>
                        </div>
                        <div class="set">
                            <label for="dstDescricao"><g:message code="anamnese.dstDescricao.label" default="Qual?" /></label>
                            <g:textField class="fc1" readonly="readonly"  name="dstDescricao" maxlength="180" value="${anamneseInstance?.dstDescricao}"/>
                        </div>
                    </div>
                    <%}%>

                    <%if(anamneseInstance?.outro){%>
                    <div class="ps1">
                        <g:checkBox name="outro" readonly="readonly"  value="${anamneseInstance?.outro}" />
                        <span for="outro"><g:message code="anamnese.outro.label" default="Outro" /></span>

                        <span for="outroDescricao"><g:message code="anamnese.outroDescricao.label" default="Qual?" /></span>
                        <g:textField readonly="readonly"  name="outroDescricao" maxlength="180" value="${anamneseInstance?.outroDescricao}"/>
                    </div>
                    <%}%>
                </div>


                <div class="ps1">
                    <p>
                        <label for="historicoFamiliar"><g:message code="anamnese.historicoFamiliar.label" default="Histórico Familiar" /></label>
                        <g:textField  class="fc1" readonly="readonly"  name="historicoFamiliar" maxlength="180" value="${anamneseInstance?.historicoFamiliar}"/>
                    </p>
                </div>

                    <div class="ps1">
                        <label>Medicacão</label>
                        <div class="set">
                            <g:checkBox readonly="readonly"  name="medicacao" value="${anamneseInstance?.medicacao}" />
                            <span for="medicacao"><g:message code="anamnese.medicacao.label" default="Nenhuma" /></span>
                        </div>
                        <%if(anamneseInstance?.medicacaoTipo){%>
                        <div class="set">
                            <label for="medicacaoTipo"><g:message code="anamnese.medicacaoTipo.label" default="Sim, Qual?" /></label>
                            <g:textField class="fc1" readonly="readonly" name="medicacaoTipo" maxlength="180" value="${anamneseInstance?.medicacaoTipo}"/>
                        </div>
                        <%}%>
                    </div>


                    <div class="ps1">

                        <label>Hábito</label>

                        <div class="set">
                            <g:checkBox readonly="readonly"  name="habito" value="${anamneseInstance?.habito}" />
                            <span for="habito"><g:message code="anamnese.habito.label" default="Nenhum" /></span>
                        </div>

                        <%if(anamneseInstance?.habitoTipo){%>
                        <div class="set">
                            <label for="habitoTipo"><g:message code="anamnese.habitoTipo.label" default="Sim, Qual?" /></label>
                            <g:textField class="fc1" readonly="readonly"  name="habitoTipo" maxlength="180" value="${anamneseInstance?.habitoTipo}"/>
                        </div>
                        <%}%>
                    </div>

                    <div class="ps1">
                        <label>Problema com dentista em tratamentos anteriores</label>

                        <div class="set">
                            <g:checkBox readonly="readonly"  name="problemaAnterior" value="${anamneseInstance?.problemaAnterior}" />
                            <span for="problemaAnterior"><g:message code="anamnese.problemaAnterior.label" default="Não" /></span>
                        </div>

                         <div class="ps1">
                             <%if(anamneseInstance?.anestesia){%>
                             <div class="sets">
                                 <g:checkBox readonly="readonly"  name="anestesia" value="${anamneseInstance?.anestesia}" />
                                 <span for="anestesia"><g:message code="anamnese.anestesia.label" default="Anestesia" /></span>
                             </div>
                             <%}%>
                             <%if(anamneseInstance?.extracao){%>
                             <div class="sets">
                                <g:checkBox readonly="readonly"  name="extracao" value="${anamneseInstance?.extracao}" />
                                <span for="extracao"><g:message code="anamnese.extracao.label" default="Extracao" /></span>
                             </div>
                              <%}%>
                             <%if(anamneseInstance?.hemorragia){%>
                             <div class="sets">
                                 <g:checkBox readonly="readonly"  name="hemorragia" value="${anamneseInstance?.hemorragia}" />
                                <span for="hemorragia"><g:message code="anamnese.hemorragia.label" default="Hemorragia" /></span>
                             </div>
                             <%}%>
                         </div>
                        <div class="ps1">

                            <%if(anamneseInstance?.desmaios){%>
                             <div class="sets">
                                <g:checkBox name="desmaios" readonly="readonly"  value="${anamneseInstance?.desmaios}" />
                                <span for="desmaios"><g:message code="anamnese.desmaios.label" default="Desmaios" /></span>
                             </div>
                             <%}%>
                            <%if(anamneseInstance?.outros){%>
                            <g:checkBox name="outros" readonly="readonly"  value="${anamneseInstance?.outros}" />
                            <span for="outros"><g:message code="anamnese.outros.label" default="Outros" /></span>
                            <%}%>
                            <%if(anamneseInstance?.outrosDescricao){%>
                            <span for="outrosDescricao"><g:message code="anamnese.outrosDescricao.label" default="" /></span>
                            <g:textField readonly="readonly"  name="outrosDescricao" maxlength="180" value="${anamneseInstance?.outrosDescricao}"/>
                            <%}%>
                        </div>

                        <div class="ps3">

                        </div>
                    </div>

                    <div class="controls">
                        <label for="consideracao"><g:message code="anamnese.consideracao.label" default="Considerações" /></label>
                        <g:textField readonly="readonly"  class="fc1" name="consideracao" maxlength="180" value="${anamneseInstance?.consideracao}"/>
                    </div>

            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${anamneseInstance?.id}" />
                    <g:actionSubmit class="btn" action="edit" value="Atualizar" />
                </g:form>
            </div>
        </div>
    </body>
</html>
