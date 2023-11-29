import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageService{

  FirebaseStorage storage = FirebaseStorage.instance;


  Future<String> updateFilePhoto(File? photo)async {
    var uuid = const Uuid().v4();
    var ref = storage.ref('photos').child(uuid);
    var url ;
    await ref.putFile(photo!).whenComplete(() async {
      url = await ref.getDownloadURL();
    });
    return url;
  }


}