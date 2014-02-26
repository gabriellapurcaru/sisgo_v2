
<%@ page import="sisgo.PlanoTratamento" %>
<html xmlns:g="http://www.w3.org/1999/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'planoTratamento.label', default: 'PlanoTratamento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <div class="row">
                <div class="span9">
                    <g:if test="${flash.message}">
                        <div class="alert alert-info" role="status">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>${flash.message}</strong></div>
                    </g:if>
                    <g:if test="${flash.success}">
                        <div class="alert alert-success" role="status">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>${flash.success}</strong></div>
                    </g:if>
                    <g:if test="${flash.error}">
                        <div class="alert alert-error" role="status">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>${flash.error}</strong></div>
                    </g:if>
                    <g:if test="${flash.warning}">
                        <div class="alert alert-warning" role="status">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>${flash.warning}</strong></div>
                    </g:if>
                </div>
            </div>

            <div class="form">
                <h4>Plano de Tratamento</h4>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <g:sortableColumn property="planoTratamento.procedimento.especialidade.label" title="Especialidade" />
                            <g:sortableColumn property="planoTratamento.procedimento.label" title="Procedimento" />
                            <th><g:message code="planoTratamento.dente.label" default="Dente" /></th>
                            <th>Face</th>
                            <g:sortableColumn property="planoTratamento.procedimento.label" title="Valor" />
                            <g:sortableColumn property="planoTratamento.procedimento.label" title="Status" />

                            <th>Data Realização</th>

                            <th>Pagamento</th>
                            <th>Ações</th>
                        </tr>

                    </thead>

                    <tbody>
                    <g:each in="${planoTratamentoInstanceList.sort{it.dhc}}"  status="i" var="planoTratamentoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${planoTratamentoInstance?.procedimento?.especialidade?.nome}</td>
                            <td>${planoTratamentoInstance?.procedimento?.nome}</td>
                            <td>${planoTratamentoInstance?.dente?.nome}</td>
                            <td>
                           <% if (planoTratamentoInstance.face1) {%>
                                <span>P/L</span>
                           <%}%>
                           <% if (planoTratamentoInstance.face2) {%>
                                <span>V</span>
                           <%}%>
                           <% if (planoTratamentoInstance.face3) {%>
                                <span>M</span>
                           <%}%>
                           <% if (planoTratamentoInstance.face4) {%>
                                <span>D</span>
                           <%}%>
                           <% if (planoTratamentoInstance.face5) {%>
                                <span>I/O</span>
                           <%}%>


                            </td>
                            <td>R$${planoTratamentoInstance?.valorProcedimento}

                            </td>
                            <td>
                            <%if(planoTratamentoInstance.pagamentoRealizado==false){%>
                                <span class="label label-important">A pagar</span>
                            <%}else{%>
                                <span class="label label-info">Pago</span>
                            <%}%>
                            </td>

                            <td>

                                <%if(planoTratamentoInstance.realizado){%>
                                     <span>
                                        <span class="label label-info">Realizado - <g:formatDate format="dd-MM-yyyy" date="${planoTratamentoInstance?.dhr}"/></span>

                                    </span>
                                <%}else{%>
                                    <g:link class="label label-important" action="addDataRealizacaoProcedimento" id="${planoTratamentoInstance.id}">A realizar</g:link>
                                <%}%>

                            </td>

                            <td>
                                <g:if test="${planoTratamentoInstance.valorPago} == ${planoTratamentoInstance.valorProcedimento}">
                                     <span>
                                        ${planoTratamentoInstance.formaPagamento}
                                         ${planoTratamentoInstance.descricao}  <br/>
                                        Valor Pago R$${planoTratamentoInstance.valorPago} <br/>
                                        <g:link  class="btn btn-mini" action="addFormaPagamento" id="${planoTratamentoInstance.id}">Adicionar Pagamento</g:link>

                                    </span>
                                </g:if>
                                <g:elseif test="${planoTratamentoInstance.valorPago} < ${planoTratamentoInstance.valorProcedimento}">
                                     <span>
                                        pagamento parcial <br>
                                        <g:link  class="btn btn-mini" action="addFormaPagamento" id="${planoTratamentoInstance.id}">Adicionar Pagamento</g:link>
                                    </span>
                                </g:elseif>
                                <g:else>
                                    <g:link  class="btn btn-mini" action="addFormaPagamento" id="${planoTratamentoInstance.id}">Adicionar Pagamento</g:link>
                                </g:else>
                            </td>

                            <td>
                                <g:link  id="${planoTratamentoInstance.id}" class="btn btn-mini" action="deletar" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >Deletar</g:link>
                            </td>

                        </tr>

                    </g:each>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th>R$${valorTotal}</b></th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>



                    </tbody>

                </table>

                <h4>Pagamento de Procedimentos</h4>
                <div class="row">
                <div class="span4">
                    <table class="table table-bordered" style="text-align:right;">
                        <tr class="info">
                            <td>Valor Total</td>
                            <td>Valor Pago</td>
                            <td>Valor Devendo</td>
                        </tr>


                        <tbody>
                        <tr>
                            <td>R$${valorTotal}</td>
                            <td>R$${valorTotalPago}</td>
                            <td>R$ ${valorDevendo}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                </div>


                <g:link controller="planoTratamento" action="create" class="btn btn-primary" params="['consulta.id': params?.id]">Novo Procedimento</g:link>
                    <input type="button" class="btn" name="imprimir" value="Imprimir" onclick="window.print();">

            </div>
            <div>

            </div>

        </div>
    </body>
</html>
