import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService{

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String?> updateProfilePhoto(photo)async{
    var ref = storage.ref('photos').child(photo.path);
    var url ;
    ref.putFile(photo).whenComplete(() async {
      url = await ref.getDownloadURL();
    });
    return url;
  }


}