import com.grailsapplication.UserPasswordEncoderListener
import com.grailsapplication.CoordinateValidatorService
import com.grailsapplication.TwoFactorAuthenticationProvider
import com.grailsapplication.TwoFactorAuthenticationDetailsSource
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    coordinateValidator(CoordinateValidatorService)
    twoFactorAuthenticationProvider(TwoFactorAuthenticationProvider) {
        coordinateValidator = ref('coordinateValidator')
        userDetailsService = ref('userDetailsService')
        passwordEncoder = ref('passwordEncoder')
        userCache = ref('userCache')
        preAuthenticationChecks = ref('preAuthenticationChecks')
        postAuthenticationChecks = ref('postAuthenticationChecks')
        authoritiesMapper = ref('authoritiesMapper')
        hideUserNotFoundExceptions = true
    }
    authenticationDetailsSource(TwoFactorAuthenticationDetailsSource)
}
