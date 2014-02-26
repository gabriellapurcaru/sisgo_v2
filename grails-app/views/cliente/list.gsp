
<%@ page import="sisgo.Cliente" %>
<html xmlns:g="http://www.w3.org/1999/html">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li><g:link controller="page" action="admin">Início</g:link><span class="divider">/</span></li>
                <li><g:link controller="planoOdontologico" action="list">Planos Odontológicos</g:link><span class="divider">/</span></li>
                <li class="active">Clientes</li>
            </ul>
            <h1>Listagem de Clientes</h1>

            <g:if test="${flash.message}">
            <div class="alert fade in">${flash.message}</div>
            </g:if>

            <g:form action="pesquisaGeral" method="GET" >
                <div class="input-append">
                    <label>Nome do Cliente:</label><input class="span2" id="nome" name="nome" size="30" type="text"><input  class="btn" type="submit" value="Pesquisar" />
                </div>
            </g:form>

            <h4>Pesquisa Aniversariante</h4>

            <g:form action="pesquisaGeral" method="GET" >
                <div class="input-append">
                    <label>Dia:</label>
                    <g:select class="span2" name="dia" id="dia" from="${['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31']}"  value="${clienteInstance?.dia}"  noSelection="['':'- Selecione -']"/> <br/>

                    <label>Mês:</label>
                    <g:select class="span2" name="mes" id="mes" from="${['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']}"  value="${clienteInstance?.mes}"  noSelection="['':'- Selecione -']"/>

                    <label>Ano:</label>
                    <g:select class="span2" name="ano" id="ano" from="${['1913','1914','1915','1916','1917','1918','1919','1920','1921','1922','1923','1924','1925','1926','1927','1928','1929','1930','1931','1932','1933','1934','1935','1936','1937','1938','1939','1940','1941','1942','1943','1944','1945','1946','1947','1948','1949','1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2024','2025','2026','2027','2028','2029','2030','2031','2032','2033','2034','2035','2036','2037','2038','2039','2040','2041','2042','2043','2044','2045','2046','2047','2048','2049','2050','2051','2052','2053','2054','2055','2056','2057','2058','2059','2060','2061','2062','2063','2064','2065','2066','2067','2068','2069','2070','2071','2072','2073','2074','2075','2076','2077','2078','2079','2080','2081','2082','2083','2084','2085','2086','2087','2088','2089','2090','2091','2092','2093','2094','2095','2096','2097','2098','2099','2100','2101','2102','2103','2104','2105','2106','2107','2108','2109','2110','2111','2112','2113']}"  value="${clienteInstance?.mes}"  noSelection="['':'- Selecione -']"/><br/><br/>

                    <input  class="btn btn-primary" type="submit" value="Pesquisar" />
                </div>
            </g:form>

            <div class="list">
                <table class="table table-bordered">
                    <thead>
                        <tr>

                            <g:sortableColumn property="nome" title="${message(code: 'cliente.nome.label', default: 'Nome')}" />
                            <td>Data Aniversário</td>
                            <td>Ações</td>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: clienteInstance, field: "nome")}</td>
                            <td>
                                <g:if test="${clienteInstance?.dia}">
                                ${clienteInstance?.dia}/${clienteInstance?.mes}/${clienteInstance?.ano}
                                </g:if>
                            </td>
                            <td>

                                <g:link class="btn btn-mini" action="show" id="${clienteInstance.id}">Dados Cliente</g:link>

                                <g:if test="${!clienteInstance?.vincularCliente}">
                                    <g:link controller="fatura" action="create" class="btn btn-mini" params="['cliente.id': clienteInstance?.id]">Adicionar Plano</g:link>
                                </g:if>

                                <g:if test="${clienteInstance?.vincularCliente}">
                                    <g:link controller="fatura" action="list" class="btn btn-mini" params="['cliente.id': clienteInstance?.id]">Ver Plano</g:link>
                                </g:if>
                                <g:link  id="${clienteInstance.id}" class="btn btn-mini" action="deleta"
                                         value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >Deletar</g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="paginateButtons">
                <g:paginate total="${clienteInstanceTotal}" />
            </div>

            <g:link class="btn btn-primary" action="create">Cadastrar Cliente</g:link>


        </div>
    </body>
</html>
