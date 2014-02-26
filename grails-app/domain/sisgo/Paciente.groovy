package sisgo;

class Paciente {

     static hasMany = [anamnese : Anamnese, consultas:Consulta, agenda:Agenda]

    int id
    String nome
    String rg
    String cpf
    String sexo
    String endereco
    String telResidencial
    String telCelular
    String telComercial
    String cep
    String email
    String estCivil
    String profissao
    String indicacao
    String obs
    String convenio
    String numeroPaciente
    String dia
    String mes
    String ano
    boolean ativo = true


    static mapping={
        table  'sisgo.pacientes'
        version false
        id nome: 'id', generator: 'sequence', params: [sequence:'sisgo.pacientes_id_seq']
        sort "nome"
        order "asc"

	}

    static constraints = {
        nome (blank: false, maxSize: 180)
        rg (blank:true, size:0..14)
        cpf (blank:true, size:0..14)
        sexo (inList: ['Feminino', 'Masculino'])
        endereco (blank:true,  size:0..180)
        telResidencial (blank: true,  maxSize: 14)
        telComercial (blank: true,  maxSize: 14)
        telCelular (blank: true, maxSize: 14)
        email (blank:true, email:true, size:0..75)
        estCivil (inList: ['Solteiro(a)', 'Casado(a)', 'Divociado(a)', 'Separado(a)'])
        profissao (blank:true, size:0..70)
        convenio (blank: true, size: 0..70)
        obs (blank: true, size: 0..255)
        indicacao(blank: true, size: 0..70)
        dia(inList: ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'])
        mes(inList: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'])
        ano(inList: ['1913','1914','1915','1916','1917','1918','1919','1920','1921','1922','1923','1924','1925','1926','1927','1928','1929','1930','1931','1932','1933','1934','1935','1936','1937','1938','1939','1940','1941','1942','1943','1944','1945','1946','1947','1948','1949','1950','1951','1952','1953','1954','1955','1956','1957','1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968','1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020','2021','2022','2023','2024','2025','2026','2027','2028','2029','2030','2031','2032','2033','2034','2035','2036','2037','2038','2039','2040','2041','2042','2043','2044','2045','2046','2047','2048','2049','2050','2051','2052','2053','2054','2055','2056','2057','2058','2059','2060','2061','2062','2063','2064','2065','2066','2067','2068','2069','2070','2071','2072','2073','2074','2075','2076','2077','2078','2079','2080','2081','2082','2083','2084','2085','2086','2087','2088','2089','2090','2091','2092','2093','2094','2095','2096','2097','2098','2099','2100','2101','2102','2103','2104','2105','2106','2107','2108','2109','2110','2111','2112','2113'])
    }

    String toString() { return "${nome}" }
}
