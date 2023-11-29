// TODO Implement this library.
enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
  invalidCredential,
  abortedByUser,
  accountAlreadyExist,
  credentialAlreadyInUse,
  passwordNotEnough,
  invalidPhoneNumber,
  invalidVerificationCode
}
class AuthExceptionHandler{
    static dynamic handleException(e) {
      AuthResultStatus status;
      switch (e.code) {
        case 'invalid-email':
          status = AuthResultStatus.invalidEmail;
          break;
        case 'invalid-phone-number':
          status = AuthResultStatus.invalidPhoneNumber;
          break;
        case 'invalid-verification-code':
          status = AuthResultStatus.invalidVerificationCode;
          break;
        case 'weak-password':
          status = AuthResultStatus.passwordNotEnough;
          break;
        case 'ýnvalýd-emaýl':
          status = AuthResultStatus.invalidEmail;
          break;
        case 'wrong-password':
          status = AuthResultStatus.wrongPassword;
          break;
        case 'user-not-found':
          status = AuthResultStatus.userNotFound;
          break;
        case 'user-disabled':
          status = AuthResultStatus.userDisabled;
          break;
        case 'user-dýsabled':
          status = AuthResultStatus.userDisabled;
          break;
        case 'too-many-requests':
          status = AuthResultStatus.tooManyRequests;
          break;
        case 'operation-not-allowed':
          status = AuthResultStatus.operationNotAllowed;
          break;
        case 'email-already-in-use':
          status = AuthResultStatus.emailAlreadyExists;
          break;
        case 'emaýl-already-ýn-use':
          status = AuthResultStatus.emailAlreadyExists;
          break;
        case 'invalid-credential':
          status = AuthResultStatus.invalidCredential;
          break;
        case 'ýnvalýd-credentýal':
          status = AuthResultStatus.invalidCredential;
          break;
        case 'ERROR_INVALID_CREDENTIAL':
          status = AuthResultStatus.invalidCredential;
          break;
        case 'aborted-by-user':
          status = AuthResultStatus.abortedByUser;
          break;
        case 'credential-already-in-use':
          status = AuthResultStatus.credentialAlreadyInUse;
          break;
        case 'credentýal-already-ýn-use':
          status = AuthResultStatus.credentialAlreadyInUse;
          break;
        case 'account-exists-with-different-credential':
          status = AuthResultStatus.accountAlreadyExist;
          break;
        case 'account-exýsts-wýth-dýfferent-credentýal':
          status = AuthResultStatus.accountAlreadyExist;
          break;
        default:
          status = AuthResultStatus.undefined;
      }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static String generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = 'E-posta adresiniz geçersiz.';
        break;
      case AuthResultStatus.passwordNotEnough:
        errorMessage = 'Parolanýz 6 karakterden uzun olmalýdýr';
        break;
      case AuthResultStatus.invalidVerificationCode:
        errorMessage = 'Girdiðiniz kod yanlýþtýr';
        break;
      case AuthResultStatus.invalidPhoneNumber:
        errorMessage = 'Telefon numaranýz geçersiz';
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = 'E-posta adresi veya þifre yanlýþ.';
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = 'Bu e-postaya ait bir kullanýcý bulunamadý.';
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = 'Kullanýcý hesabý aktif deðil.';
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage =
        'Çok fazla istek gönderildi. Lütfen daha sonra tekrar deneyin.';
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = 'E-posta adresiyle giriþe izin verilmiyor.';
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
          'Bu E-posta adresiyle daha önce hesap oluþturulmuþ. Lütfen baþka bir e-posta adresi kullanýn.';
        break;
      case AuthResultStatus.accountAlreadyExist:
        errorMessage =
          'Kullandýðýnýz e-posta adresiyle baþka bir hesap mevcut. Lütfen diðer yöntemlerle giriþ yapýn.';
        break;
      case AuthResultStatus.credentialAlreadyInUse:
        errorMessage =
          'Bu giriþ kimliði baþka bir hesapla iliþkilendirilmiþ. Lütfen baþka bir hesapla giriþ yapmayý deneyin';
      break;
      case AuthResultStatus.invalidCredential:
        errorMessage =
          'Bu giriþ yönteminde bir sorun var. Lütfen farklý bir giriþ yöntemi seçiniz.';
        break;
      case AuthResultStatus.abortedByUser:
        errorMessage = 'Giriþ kullanýcý tarafýndan iptal edildi.';
        break;
      default:
    errorMessage = 'Tanýmsýz bir hata oluþtu.';
  }
  return errorMessage;
  }

}