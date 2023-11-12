
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  TextEditingController _epostaController = TextEditingController();
  TextEditingController _sifreController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giri� Sayfasi"),
      ),
      body: _buildBody(context),
    );
  }

 Widget _buildBody(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Column(
          children: [
            TextField(
              controller: _epostaController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "E-posta",
                ),
              ),
              SizedBox(height: 16,),
              TextField(
              controller: _sifreController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "�ifre",
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Giri� Yap"),
                onPressed: () {
                  _epostaVeSifreIleGiris(context);
                  },
                ),
              ),
            SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Hesab�n�z yok mu? Kay�t olun"),
                  onPressed: () {
                    _kayitSayfasiniAc(context);
               },
              ),
             ),
             SizedBox(height: 16),
              TextButton(
               child: Text("�ifremi unuttum",
                 style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: onPressed() {
                _sifreSifirla(context);
              },
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Google ile giri�"),
                onPressed: () {
                  _googleIleGiris(context);
                },
               ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Apple ile giri�"),
                    onPressed: () {
                      _appleIleGiris(context);
                    },
                  ),
                ),
               Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Telefon Numaras�  ile giri�"),
                      onPressed: () {
                        _telefonNumarasiIleGiris(context);
                       },
                     ),
                    ),
                  ],
                ),
    );
 }
}
