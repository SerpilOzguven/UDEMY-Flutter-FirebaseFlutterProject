import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/repository/kimlik_dogrulama_repository.dart';
import 'package:provider/provider.dart';

class TelefonIleGirisViewModel with ChangeNotifier{
  final KimlikDogrulamaRepository _kimlikDogrulamaRepository = locator<KimlikDogrulamaRepository>();

  bool _dogrulamaBolumuGoster = false;

  bool get dogrulamaBolumunuGöster => _dogrulamaBolumuGoster;
  set dogrulamaBolumunuGoster(bool value) {
    _dogrulamaBolumuGoster = value;
    notifyListeners();
  }
  dynamic _dogrulamaIdsi = "";

  void girisSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu =MaterialPageRoute(
        builder: (BuildContext context) {
          return ChangeNotifierProvider(
              create: (BuildContext context) = GirisViewModel(),
              child: GirisSayfasi(),
          );
        },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }
  void _kitaplarSayfasiniAc(BuildContext context){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
        builder: (BuildContext context) {
          return ChangeNotifierProvider(
              create: (BuildContext context) => KitaplarViewModel(),
              child: KitaplarSayfasi(),
          );
        },
    );
  }
  Navigator.pushReplacement(context, sayfaYolu);
}
void dogrulamaKoduGonder(
BuildContext context,
String telefonNumarasi,

) {
  if (telefonNumarasi.isNotEmpty) {
    await _kimlikDogrulamaRepository.telefonDogrulamaKoduGonder(
      telefonNumarasi,
      otomatikDogrulama:(kullaniciId) {
        _otomatikDogrulama(context, kullaniciId);
      },
      dogrulamaBasarisiz:_dogrulamaBasarisiz,
      dogrulamaKoduGönderildi: _dogrulamaKoduGonderildi,
      kodZamanAsimi:_kodZamanAsimi,

    );
  }
}
void _otomatikDogrulama(BuildContext context,kullaniciId) {
  if(kullaniciId != null) {
    print("Telefon Numarasý ile giriþ baþarýlý.");
    _kitaplarSayfasiniAc(context);
  }
}

void _dogrulamaBasarisiz(String hata) {
  if (hata == ',nvalid-phone-number') {
    print("Telefon numarasý geçersiz.");

  } else {
    print("iþlem baþarýsýz.");
  }
}

void _dogrulamaKoduGonderildi(dogrulamaIdsi) {
  _dogrulamaIdsi = dogrulamaIdsi;
  dogrulamaBolumunuGoster = true;
}

void _kodZamanAsimi(){
  print("Dogrulama kodu zaman aþýmýna uðradý.");
}

Future<void> dogrulamaKoduOnayla(
  BuildContext context,
  String dogrulamaKodu,

) async {
  if (_dogrulamaIdsi.isNotEmpty && dogrulamaKodu.isNotEmpty) {
    dynamic kullaniciId = await _kimlikDogrulamaRepository
        .telefonDogrulamaKodunuOnayla(_dogrulamaIdsi, dogrulamaKodu);
    if (kullaniciId != null) {
      _kitaplarSayfasiniAc(context);
    }
  }
}
}