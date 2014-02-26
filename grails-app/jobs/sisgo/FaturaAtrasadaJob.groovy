package sisgo

class FaturaAtrasadaJob {
    def faturaService
    static triggers = {
        cron name: 'cronTrigger2', cronExpression: "0 58 19 * * ?"
    }

    def execute() {
        faturaService.faturasAtrasadas()
        log.info("Execute faturasAtrasadasJob em: ${new Date()}")
        println "\n\n ------------ Execute faturaAtrasadaJob em: ${new Date()} -------------- \n\n "
    }
}
