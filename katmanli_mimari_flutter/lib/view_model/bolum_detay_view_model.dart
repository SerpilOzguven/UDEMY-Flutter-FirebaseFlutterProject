import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/model/bolum.dart';
import 'package:katmanli_mimari_flutter/repository/veri_tabani_repository.dart';

class BolumDetayViewModel with ChangeNotifier {
  final VeriTabaniRepository _veriTabaniRepository =
      locator<VeriTabaniRepository>();

  final Bolum bolum;

  BolumDetayViewModel(this.bolum);

  void icerigiKaydet(String icerik) async {
    bolum.icerik = icerik;
    await _veriTabaniRepository.updateBolum(bolum);
  }
}
