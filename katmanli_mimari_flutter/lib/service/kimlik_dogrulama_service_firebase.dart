import 'package:firebase_auth/firebase_auth.dart';
import 'package:katmanli_mimari_flutter/service/base/kimlik_dogrulama_service.dart';

abstract class FirebaseKimlikDogrulamaService
    implements KimlikDogrulamaService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future kullaniciIdsiniGetir() async {
    return await _auth.currentUser?.uid;
  }

  @override
  Future epostaVeSifreIleGiris(String eposta, String sifre) async {
    try {
      UserCredential kullaniciKimligi = await _auth.signInWithEmailAndPassword(
        email: eposta,
        password: sifre,
      );
      User? kullanici = kullaniciKimligi.user;
      return kullanici?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Kullan�c� bulunamad�.");
      } else if (e.code == "wrong-password") {
        print("Yanl�� �ifre girdiniz.");
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
