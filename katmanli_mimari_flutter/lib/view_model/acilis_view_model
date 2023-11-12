import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/view/giris_sayfasi.dart';

class AcilisViewModel extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    _yonlendir(context);
    return Scaffold(
      body: Center(
        child: Text(
          "Yazar",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _yonlendir(BuildContext context) {
    WidgetsFlutterBinding.instance?.addPostFrameCallback((_) {
      User? kullanici = _auth.currentUser;

      if (kullanici != null) {
        _kitaplarSayfasiniAc(context);
      } else {
        _girisSayfasiniAc(context);
      }
    });
  }

  void _girisSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return GirisSayfasi();
      },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }

  void _kitaplarSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return KitaplarSayfasi();
      },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }
}
