import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/user_model.dart';
import 'package:firebase/provider/auth_provider.dart';
import 'package:firebase/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userService = UserService();
  final _authProvider = AuthProvider();

  UserProvider(){
    print('�al��t�r');
  }

  void getMap()async{
    var snapshot = await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .get();
    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.arrayRemove([1])});//burada da belirledi�imiz eleman� kald�r�yor
    /*
    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.arrayUnion([])});//eleman veya listede[] ekleniyor.
        //update yerine set yazarsak s�f�rdan olu�turur.

    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.delete()});//Komple sildi


    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.increment(1)});//art�rmak i�in 1 yaz�yoruz
        //.update({'number': FieldValue.increment(-1)});//eksilmek i�i -1 yaz�yoruz

    print(UserModel.fromJson(snapshot.data()!).myMap.id);
    print(UserModel.fromJson(snapshot.data()!).liste![0]);
    List<int>? liste = UserModel.fromJson(snapshot.data()!).liste!;
    for(var item in liste){
      print(item);
    }
     */
    //Timestamp? date = UserModel.fromJson(snapshot.data()!).degerim;
    //print(date!.toDate());
    //var date1 = Timestamp.fromDate(DateTime.now());
    //firestore.collection('users').doc('pxJsbFaj9hSop6lqWWXK').set({'degerim':date1});
  }
  void updateUser(String name,String id,BuildContext context)async {
    var isResult = await userService.updateUser(name, id);
    if (isResult == true) {
      print('Ba�ar�l�');
    var user = await userService.readUser(id);
    Provider.of<AuthProvider>(context,listen:false).user!.name = name;
    notifyListeners();
    }
  }
  }
}