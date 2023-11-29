// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/user_model.dart';
import 'package:firebase/provider/auth_provider.dart';
import 'package:firebase/service/auth_service.dart';
import 'package:firebase/service/storage_service.dart';
import 'package:firebase/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final userService = UserService();
  final authService = AuthService();
  final storageService = StorageService();
  UserModel user = UserModel();

  UserProvider() {
    currentUser();
  }


  Future<void> updateUser(String name, String id) async {
    var isResult = await userService.updateUser(name, id);
    if (isResult == true) {
      var user = await userService.readUser(name,id);
      this.user = user!;
      notifyListeners();
    }
  }

  Future<void> currentUser(String name, String uid) async {
    User? firebaseUser = authService.currentUser();
    if (firebaseUser != null) {
      user = (await userService.readUser(name,firebaseUser.uid))!;
      notifyListeners();
    }
  }

  Future<void> updateProfilePhoto(File? photo, String? id)async{
    String? url = await storageService.updateFilePhoto(photo);
    if (url != null){
      var result = await userService.updateFilePhoto(url,id!);
      if (result == true){
        user = (await userService.readUser(id))!;
        notifyListeners();
      }
    }else{
      print('url null');
    }
  }
}
  /*
  void getMap()async{
    var snapshot = await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .get();
    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.arrayRemove([1])});//burada da belirlediðimiz elemaný kaldýrýyor

    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.arrayUnion([])});//eleman veya listede[] ekleniyor.
        //update yerine set yazarsak sýfýrdan oluþturur.

    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.delete()});//Komple sildi


    await firestore
        .collection('users')
        .doc('pxJsbFaj9hSop6lqWWXK')
        .update({'number': FieldValue.increment(1)});//artýrmak için 1 yazýyoruz
        //.update({'number': FieldValue.increment(-1)});//eksilmek içi -1 yazýyoruz

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
