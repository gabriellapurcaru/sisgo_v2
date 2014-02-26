

<%@ page import="sisgo.PlanoTratamento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'planoTratamento.label', default: 'PlanoTratamento')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <g:javascript library="prototype" />
        <g:javascript>
            function updateProcedimento(e) {
            var procedimentos = eval("(" + e.responseText + ")")

            if(procedimentos) {
            var rselect = document.getElementById('procedimento')
            var l = rselect.length
            while (l > 0) {
            l--
            rselect.remove(l)
            }

            for (var i=0; i < procedimentos.length; i++) {
            var procedimento = procedimentos[i]
            var opt = document.createElement('option');
            opt.text = procedimento.nome
            opt.value = procedimento.id
            try {
            rselect.add(opt, null)
            }
            catch(ex) {
            rselect.add(opt)
            }
            }
            }
            }

            var zselect = document.getElementById('especialidade.nome')
            var zopt = zselect.options[zselect.selectedIndex]
            ${remoteFunction(controller:"especialidade", action:"ajaxGetProcedimentos", params:"'id=' + zopt.value", onComplete:"updateProcedimento(e)")}
        </g:javascript>

    </head>
    <body>

        <div class="body">

            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${planoTratamentoInstance}">
            <div class="alert alert-block alert-error fade in">
                <g:renderErrors bean="${planoTratamentoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <g:hiddenField name="consulta.id" value="${params.consulta.id}" />
                <div class="form">

                    <h1>Procedimentos</h1>
                    <table>
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <h4>Especialidade</h4>
                                <g:select class="selectl"
                                          optionKey="id" optionValue="nome"  noSelection="['':'-Selecione opção-']" name="especialidade.id" id="especialidade.nome" from="${sisgo.Especialidade.list()}"
                                          onchange="${remoteFunction(
    controller:'especialidade',
    action:'ajaxGetProcedimentos',
    params:'\'id=\' + escape(this.value)',
    onComplete:'updateProcedimento(e)')}"></g:select>


                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="value ${hasErrors(bean: planoTratamentoInstance, field: 'especialidade', 'errors')}">
                                <h4>Procedimento</h4>
                                <g:select class="span6" name="procedimento.id" optionKey="id" id="procedimento" noSelection="['':'-Selecione opção-']"></g:select>
                            </td>
                        </tr>


                        <tr>
                            <td valign="top" class="name">
                               <h4>Dente</h4>
                                <g:select name="dente.id" id="dente" from="${sisgo.Dente.list()}" optionKey="id" optionValue="nome"  noSelection="['':'-Selecione uma opção -']"/>

                            </td>

                        </tr>

                        <tr>
                            <td valign="top" class="name">
                                <h4>Face</h4>
                                <label class="checkbox inline"><g:checkBox name="face1" value="${planoTratamentoInstance?.face1}" /> P/L</label>
                                <label class="checkbox inline"><g:checkBox name="face2" value="${planoTratamentoInstance?.face2}" /> V</label>
                                <label class="checkbox inline"><g:checkBox name="face3" value="${planoTratamentoInstance?.face3}" /> M</label>
                                <label class="checkbox inline"><g:checkBox name="face4" value="${planoTratamentoInstance?.face4}" /> D </label>
                                <label class="checkbox inline"><g:checkBox name="face5" value="${planoTratamentoInstance?.face5}" /> I/O</label>


                            </td>

                        </tr>

                        </tbody>
                        </table>

                        </tbody>
                    </table>
                    <div class="buttons">
                        <span class="button"><g:submitButton name="create" class="btn btn-mini" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                    </div>
                </div>

            </g:form>
        </div>
    </body>
</html>
