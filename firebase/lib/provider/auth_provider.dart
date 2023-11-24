// TODO Implement this library.import 'package:firebase/model/user_model.dart';
import 'package:firebase/model/user_model.dart';
import 'package:firebase/service/auth_service.dart';
import 'package:firebase/utils/exceptions_handlers/auth_exception_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier{

  final authService = AuthService();
  UserModel user = UserModel();

  Future registerWithEmail(String email, String password, String name) async {
    try {
      var user = await authService.registerWithEmail(email, password);
      user!.sendEmailVerification();
      FirebaseAuth.instance.signOut();
      return 'Mailinize onay kodu gönderilmiþtir';
    } catch (e) {
      var exception = AuthExceptionHandler.handleException(e);
      return AuthExceptionHeandler.generateExceptionMessage(exception);
    }
  }

  void registerWithPhoneNumber(String phoneNumber) async {
    try {
      await authService.registerWithPhoneNumber(phoneNumber);
    } catch (e) {
      print('hata var $e');
    }
  }
  Future<User?> phoneNumberControl(String smsCode, verificationId)async{
    try {
      return await authService.phoneNumberControl(smsCode, verificationId);
    } catch (e) {
      var exceptionCode = AuthExceptionHandler.handleException(e);
      var exceptionMessage = AuthExceptionHandler .generateExceptionMessage (exceptionCode);
      Get.showSnackbar(GetSnackBar(
        title: 'Hata',
        message: exceptionMessage,
        duration: const Duration(seconds: 1),
      ));
      print('hata var $e' );
    }
  }

  Future<User?> registerWithGoogle()async{
    try{
      return await authService.registerWithGoogle();

    }catch(e){
      print('hata var $e');
      return null;
    }
  }

  Future loginWithEmail(String email, String password)async{
    try{
      var user = await authService.loginWithEmail(email,password);
      if(user.emailVerified) {
        return user;
      }else{
        return 'Lütfen mailinize gelen kodu onaylayýnýz';

      }
    }catch(e){
      var exceptionCode = AuthExceptionHandler.handleException(e);
      var exceptionMessage = AuthExceptionHandler .generateExceptionMessage (exceptionCode);
      Get.showSnackbar(GetSnackBar(
        title: 'Hata',
        message: exceptionMessage,
        duration: const Duration(seconds: 1),

      ));
      return e.toString();
      }
    }
    Future<void> signOut()async{
      try{
         authService.signOut();
      }catch(e){
        print('sign out hata var');
        Get.snackbar('Hata', 'Çýkýþ yapýlmadý $e')

      }

    }
  }

