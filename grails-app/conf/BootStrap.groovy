
import sisgo.Clinica
import sisgo.auth.SecRole
import sisgo.auth.SecUser
import sisgo.auth.SecUserSecRole
import org.omg.CORBA.PolicyOperations

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def clinica1 = sisgo.Clinica.findByName('clinica 1') ?: new sisgo.Clinica(name:'clinica 1').save(failOnError: true)
        def clinica2 = sisgo.Clinica.findByName('clinica 2') ?: new sisgo.Clinica(name:'clinica 2').save(failOnError: true)
        def clinica3 = sisgo.Clinica.findByName('clinica 3') ?: new sisgo.Clinica(name:'clinica 3').save(failOnError: true)

        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new sisgo.auth.SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new sisgo.auth.SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = SecUser.findByUsername('admin') ?: new sisgo.auth.SecUser(
                username: 'admin',
                primeiroNome: 'joao',
                ultimoNome: 'da silva',
                password: '111',
                email: 'teste2323@gmail.com',
                userTenantId: clinica1.id,
                enabled: true).save(failOnError: true)

        def usuario1 = SecUser.findByUsername('user1') ?: new sisgo.auth.SecUser(
                username: 'user1',
                primeiroNome: 'maria',
                ultimoNome: 'da silva',
                password: '1111',
                email: 'teste22323344@gmail.com',
                userTenantId: clinica1.id,
                enabled: true).save(failOnError: true)

        def usuario2 = SecUser.findByUsername('user2') ?: new sisgo.auth.SecUser(
                username: 'user2',
                primeiroNome: 'jose',
                ultimoNome: 'da silva11',
                password: '1111',
                email: 'teste22@gmail.com',
                userTenantId: clinica2.id,
                enabled: true).save(failOnError: true)

        def usuario3 = SecUser.findByUsername('user3') ?: new sisgo.auth.SecUser(
                username: 'user3',
                primeiroNome: 'tadeu',
                ultimoNome: 'da silva111',
                password: '1111',
                email: 'teste222@gmail.com',
                userTenantId: clinica3.id,
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }

        if (!usuario1.authorities.contains(userRole)) {
            SecUserSecRole.create usuario1, userRole
        }

        if (!usuario2.authorities.contains(userRole)) {
            SecUserSecRole.create usuario2, userRole
        }

        if (!usuario3.authorities.contains(userRole)) {
            SecUserSecRole.create usuario3, userRole
        }

    } as Object
    def destroy = {
    }
}
