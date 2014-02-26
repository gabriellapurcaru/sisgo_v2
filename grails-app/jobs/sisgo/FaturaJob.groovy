package sisgo

class FaturaJob {
    def faturaService
    static triggers = {
        cron name: 'cronTrigger', cronExpression: "0 40 7 * * ?"
    }

    def execute() {
        println "\n\n ------------ Execute faturaJob em: ${new Date()} -------------- \n\n "
        faturaService.geraFaturas()
        log.info("Execute faturaJob em: ${new Date()}")


        println "\n\n ------------ Execute faturaAtrasadaJob em: ${new Date()} -------------- \n\n "
        faturaService.faturasAtrasadas()
        log.info("Execute faturasAtrasadasJob em: ${new Date()}")

    }
}
