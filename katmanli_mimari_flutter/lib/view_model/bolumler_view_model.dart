import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/model/bolum.dart';
import 'package:katmanli_mimari_flutter/repository/veri_tabani_repository.dart';
import 'package:katmanli_mimari_flutter/view/bolum_detay_sayfasi.dart';
import 'package:katmanli_mimari_flutter/view_model/bolum_detay_view_model.dart';
import 'package:provider/provider.dart';


class BolumlerViewModel with ChangeNotifier {
  final VeriTabaniRepository _veriTabaniRepository = locator<VeriTabaniRepository>();

  List<Bolum> bolumler = [];

  BolumlerViewModel(this.kitap) {
    _tumBolumleriGetir();
  }

  Future<void> bolumEkle(BuildContext context) async {
    String bolumBasligi =
        await pencereAc(context, "B�l�m Ad�n� Giriniz") ?? "";
    dynamic kitapId = kitap.id;
    if (bolumBasligi.isNotEmpty && kitapId != null) {
      Bolum yeniBolum = Bolum(kitapId, bolumBasligi, kitap.kullaniciId);
      dynamic bolumIdsi = await _veriTabaniRepository.createBolum(yeniBolum);
      debugPrint("Bolum Idsi: " + bolumIdsi.toString());
      _tumBolumleriGetir();

  }

}

  Future<void> _tumBolumleriGetir() async {
    dynamic kullaniciId = kitap.kullaniciId;
    dynamic kitapId = kitap.id;
    if (kullaniciId != null && kitapId != null) {
      bolumler = await _veriTabaniRepository.readTumBolumler(
        kullaniciId,
        kitapId,
      );
    }
    notifyListeners();
  }

  Future<void> bolumGuncelle(BuildContext context, int index)  async {
    String yeniBolumBasligi = await pencereAc(context, "B�l�m G�ncelle") ?? "";
    if (yeniBolumBasligi.isNotEmpty) {
      Bolum bolum = bolumler[index];
      bolum.baslik = yeniBolumBasligi;
      int guncellenenSatirSayisi = await _veriTabaniRepository.updateBolum(
        bolum,
      );
    }
  }

  Future<void> bolumSil(int index) async {
    Bolum bolum = bolumler[index];
  int silinenSatirSayisi = await _veriTabaniRepository.deleteBolum(bolum);
  if (silinenSatirSayisi > 0) {
    bolumler.removeAt(index);
    notifyListeners();
  }}

  void bolumDetaySayfasiniAc(BuildContext context, int index) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (BuildContext context) => BolumDetayViewModel(
            bolumler[index],
          ),
          child: BolumDetaySayfasi(),
        );
      },
    );
    Navigator.push(context, sayfaYolu);
  }
  }
}

  pencereAc(BuildContext context, String s) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String sonuc = "";
        return AlertDialog(
          title: Text(baslik),
          content: TextField(
            keyboardType: TextInputType.text,
            onChanged: (String inputText) {
              sonuc = inputText;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text("�ptal"),
              onPressed: () {
                Navigator.pop(context, "");
              },
            ),
            TextButton(
              child: Text("Onayla"),
              onPressed: () {
                Navigator.pop(context, sonuc.trim());
              },
            ),
          ],
        );
      },
    );
  }


