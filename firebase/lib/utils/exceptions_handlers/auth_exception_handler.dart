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
        case '�nval�d-ema�l':
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
        case 'user-d�sabled':
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
        case 'ema�l-already-�n-use':
          status = AuthResultStatus.emailAlreadyExists;
          break;
        case 'invalid-credential':
          status = AuthResultStatus.invalidCredential;
          break;
        case '�nval�d-credent�al':
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
        case 'credent�al-already-�n-use':
          status = AuthResultStatus.credentialAlreadyInUse;
          break;
        case 'account-exists-with-different-credential':
          status = AuthResultStatus.accountAlreadyExist;
          break;
        case 'account-ex�sts-w�th-d�fferent-credent�al':
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
        errorMessage = 'E-posta adresiniz ge�ersiz.';
        break;
      case AuthResultStatus.passwordNotEnough:
        errorMessage = 'Parolan�z 6 karakterden uzun olmal�d�r';
        break;
      case AuthResultStatus.invalidVerificationCode:
        errorMessage = 'Girdi�iniz kod yanl��t�r';
        break;
      case AuthResultStatus.invalidPhoneNumber:
        errorMessage = 'Telefon numaran�z ge�ersiz';
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = 'E-posta adresi veya �ifre yanl��.';
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = 'Bu e-postaya ait bir kullan�c� bulunamad�.';
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = 'Kullan�c� hesab� aktif de�il.';
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage =
        '�ok fazla istek g�nderildi. L�tfen daha sonra tekrar deneyin.';
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = 'E-posta adresiyle giri�e izin verilmiyor.';
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
          'Bu E-posta adresiyle daha �nce hesap olu�turulmu�. L�tfen ba�ka bir e-posta adresi kullan�n.';
        break;
      case AuthResultStatus.accountAlreadyExist:
        errorMessage =
          'Kulland���n�z e-posta adresiyle ba�ka bir hesap mevcut. L�tfen di�er y�ntemlerle giri� yap�n.';
        break;
      case AuthResultStatus.credentialAlreadyInUse:
        errorMessage =
          'Bu giri� kimli�i ba�ka bir hesapla ili�kilendirilmi�. L�tfen ba�ka bir hesapla giri� yapmay� deneyin';
      break;
      case AuthResultStatus.invalidCredential:
        errorMessage =
          'Bu giri� y�nteminde bir sorun var. L�tfen farkl� bir giri� y�ntemi se�iniz.';
        break;
      case AuthResultStatus.abortedByUser:
        errorMessage = 'Giri� kullan�c� taraf�ndan iptal edildi.';
        break;
      default:
    errorMessage = 'Tan�ms�z bir hata olu�tu.';
  }
  return errorMessage;
  }

}