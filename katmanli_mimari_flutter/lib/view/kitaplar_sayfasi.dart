import 'package:flutter/material.dart';

class KitapSayfasi extends StatefulWidget {
  const KitapSayfasi({Key? key}) : super(key: key);

  @override
  State<KitapSayfasi> createState() => _KitapSayfasiState();
}

class _KitapSayfasiState extends State<KitapSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitaplar Sayfasý"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _seciliKitaplariSil,
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _cýkýsYap(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _kitapEkle(context);
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildListview();
  }

  Widget _buildListview() {
    return Column(
      children: [
        _kategoriFiltresi(),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: kitaplar.length,
            itemBuilder: _buildListTile,
          ),
        ),
      ],
    );
  }


  Widget _buildListTile(BuildContext context, int index) {
    return ListTile(
      leading: SizedBox(
        width: 48,
        height: 48,
        child: Image.network(_kitaplar[index].resim ??
            "https://firestorage.googleapis.com"
                "/v0/b/yazar_d3654.appshot.com/o"),
        "/flutter_logo.jpg?alt=media&token="
            "6b76a533-397b-4d87-8e9f-f4a481e52f27",
        fit: BoxFit.cover,

      ),

    title:Text(_kitaplar[index].isim),
    subtitle:
    Text(Sabitler.kategoriler[_kitaplar[index].kategori] ?? ""),
      trailing:Row(
        mainAxisAlignment: MainAxisAlignment.min,
        children: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed:(){
              _resimEkle(context, index);
            },
          ),
          IconButton(
          icon: Icon(Icons.edit),
          onPressed: _kitapGüncelle(context, index);
  },
          ),
          Checkbox(
              value:
              _secilenKitapIdleri.contains(_kitaplar[index].id),
              onChanged: (bool? yeniDeger) {},
          ),
        ],
      )
      onTap: () {
        _bolumlerSayfasiniAc(context,index);
      },
    );
  }
 Widget _kategoriFiltresi() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text("kategori:"),
      style:TextStyle(fontSize:16),
      ),
      DropdownButton(
        value: _secilenKategori,
        onChanged: (int? yeniSecilenKategori) {},
          (kategoriId) {
            return DropdownMenuItem<int>(
              value: kategoriId,
              child:Text(kategoriId == -1
                ? "Hepsi"
                :Sabitler.kategorilerId] ?? ""),

            );
          },
        ).toList(),
      ),
    ],
  );

  }
    ),


  
}

