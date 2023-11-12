import 'package:flutter/material.dart';

class BolumlerSayfasi extends StatelessWidget {
  const BolumlerSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B�l�mler Sayfas�"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    BolumlerViewModel viewModel = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.kitap.isim),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          viewModel.bolumEkle(context);
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildListView();
  }

  Widget _buildListView() {
    return Consumer<BolumlerViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.bolumler.length,
        itemBuilder: (BuildContext context, int index) {
          return ChangeNotifierProvider.value(
            value: viewModel.bolumler[index],
            child: _buildListTile(context, index),
          );
        },
      ),
    );
  }

  Widget _buildListTile(BuildContext context, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Consumer<Bolum>(
          builder: (context, bolum, child) => Text(bolum.id.toString()),
        ),
      ),
      title: Consumer<Bolum>(
        builder: (context, bolum, child) => Text(bolum.baslik),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              BolumlerViewModel viewModel = Provider.of<BolumlerViewModel>(
                context,
                listen: false,
              );
              viewModel.bolumGuncelle(context, index);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              BolumlerViewModel viewModel = Provider.of<BolumlerViewModel>(
                context,
                listen: false,
              );
              viewModel.bolumSil(index);
            },
          ),
        ],
      ),
      onTap: () {
        BolumlerViewModel viewModel = Provider.of<BolumlerViewModel>(
          context,
          listen: false,
        );
        viewModel.bolumDetaySayfasiniAc(context, index);
      },
    );

}
