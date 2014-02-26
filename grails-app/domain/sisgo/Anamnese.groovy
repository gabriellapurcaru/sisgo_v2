package sisgo

class Anamnese {

    Paciente paciente

    Date ultimaVisita = new Date()

    boolean problemaSaude = false
    boolean cardiaco = false
    boolean asmatico = false
    boolean disturbioHormonais = false
    boolean diabetico = false
    boolean hepatite = false
    boolean problemaRenal = false
    boolean gestante = false
    boolean hipertenso = false
    String hipertensaoDescricao
    boolean anemia = false
    boolean dst = false
    String dstDescricao
    boolean outro
    String outroDescricao

    String historicoFamiliar

    boolean medicacao = false
    String medicacaoTipo

    boolean habito = false
    String habitoTipo

    boolean problemaAnterior = false
    boolean anestesia = false
    boolean extracao = false
    boolean hemorragia = false
    boolean alergia = false
    boolean desmaios = false
    boolean outros = false
    String outrosDescricao

    String consideracao

    static mapping={
			table  'sisgo.anamneses'
			version false
            id name: 'id', generator: 'sequence', params: [sequence:'sisgo.anamneses_id_seq']
			paciente column:'paciente_id'
	}

    static constraints = {
        ultimaVisita (blank:true, size:0..10)
    }
}
