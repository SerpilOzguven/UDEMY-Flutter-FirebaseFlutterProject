import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }
}

class ProductAddState extends State {
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();

  var dbHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            buildUnitPriceField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı:"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması:"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Birim Fİyatı:"),
      controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return TextButton(
        onPressed: () {
          addProduct();
        },
        child: const Text("Kaydet"));
  }

  void addProduct() async {
    dbHelper.insert.Product();
    Navigator.pop(context, true);
  }
}
