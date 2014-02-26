class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller:"page", action:"inicio")

        "/especialidades"(controller:"page", action:"especialidades")
        "/curiosidades"(controller:"conteudo", action:"listagem")
        "/credenciamento"(controller:"page", action:"credenciamento")
        "/faleComigo"(controller:"page", action:"faleComigo")
        "/profissional"(controller:"page", action:"profissional")

		"500"(view:'/error')

	}
}
