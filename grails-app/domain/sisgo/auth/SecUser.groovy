package sisgo.auth

class SecUser {

    transient springSecurityService

    Integer userTenantId

    String primeiroNome
    String ultimoNome
    String username
    String email
    String email2
    String password
    String password2
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        userTenantId(min: 0)
        primeiroNome(blank: true, maxSize: 50)
        ultimoNome(blank: true, maxSize: 100)
        username blank: false, unique: true //, matches:"[a-zA-Z1-9]+"
        password(blank: false, nullable: false, minsize: 6, validator: {password, obj ->
            def password2 = obj.properties['password2']
            if(password2 == null) return true // skip matching password validation (only important when setting/resetting pass)
            password2 == password ? true : ['invalid.matchingpasswords']
        })

        email(email:true, blank: false, nullable: false, unique: true, minsize: 6, validator: {email, obj ->
            def email2 = obj.properties['email2']
            if(email2 == null) return true // skip matching password validation (only important when setting/resetting pass)
            email2 == email ? true : ['invalid.matchingemails']
        })
    }

    static mapping = {
        id name: 'id', generator: 'sequence', params: [sequence:'sec_user_id_seq']
        password column: '`password`'
    }

    Set<SecRole> getAuthorities() {
        SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }

    String toString() { return "${username}" }

    static transients = ['password2', 'email2']
}


