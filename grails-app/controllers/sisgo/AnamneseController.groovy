package sisgo

class AnamneseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [anamneseInstanceList: Anamnese.list(params), anamneseInstanceTotal: Anamnese.count()]
    }

    def create = {
        def anamneseInstance = new Anamnese()
        def pacienteInstance
        if(params?.paciente?.id){
            pacienteInstance = Paciente.get(params.paciente.id)
            anamneseInstance.paciente = pacienteInstance
        }
        anamneseInstance.properties = params
        return [anamneseInstance: anamneseInstance, pacienteInstance:pacienteInstance]
    }

    def save = {
        def anamneseInstance = new Anamnese(params)


        if (anamneseInstance.save(flush: true)) {
            flash.message = "Anamnese Cadastrado com Sucesso!"
            redirect(action: "show", id: anamneseInstance.id)
        }
        else {
            render(view: "create", model: [anamneseInstance: anamneseInstance])
        }
    }

    def show = {
        def anamneseInstance = Anamnese.get(params.id)
        if (!anamneseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anamnese.label', default: 'Anamnese'), params.id])}"
            redirect(action: "list")
        }
        else {
            [anamneseInstance: anamneseInstance]
        }
    }

    def edit = {
        def anamneseInstance = Anamnese.get(params.id)
        if (!anamneseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anamnese.label', default: 'Anamnese'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [anamneseInstance: anamneseInstance]
        }
    }

    def update = {
        def anamneseInstance = Anamnese.get(params.id)
        if (anamneseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (anamneseInstance.version > version) {
                    
                    anamneseInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'anamnese.label', default: 'Anamnese')] as Object[], "Another user has updated this Anamnese while you were editing")
                    render(view: "edit", model: [anamneseInstance: anamneseInstance])
                    return
                }
            }
            anamneseInstance.properties = params
            if (!anamneseInstance.hasErrors() && anamneseInstance.save(flush: true)) {
                flash.message = "Anamnese Atualizado com Sucesso!"
                redirect(action: "show", id: anamneseInstance.id)
            }
            else {
                render(view: "edit", model: [anamneseInstance: anamneseInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anamnese.label', default: 'Anamnese'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def anamneseInstance = Anamnese.get(params.id)
        if (anamneseInstance) {
            try {
                anamneseInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'anamnese.label', default: 'Anamnese'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'anamnese.label', default: 'Anamnese'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anamnese.label', default: 'Anamnese'), params.id])}"
            redirect(action: "list")
        }
    }
}
