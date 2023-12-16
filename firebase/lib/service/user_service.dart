
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserModel?> saveUser(
      String? email, String name, String uid, {isEmail}) async {
    await firestore.collection('users').doc(uid).set({
      isEmail == false ? 'phoneNumber' : 'email': email,
      'name': name,
      'id': uid,
      'profilPhoto': 'https://en.m.wikipedia.org/wiki/File:User_icon_2.svg'
    });
  }

  Future<UserModel?> readUser(String uid) async {
    var source = await firestore.collection('users').doc(uid).get();
    return UserModel.fromDoc(source);
  }

  Future<UserModel?> userController(String uid) async {
    var source = await firestore.collection('users').doc(uid).get();
    if (source.data() != null) {
      return readUser(uid);
    } else {
      print('data yok');
      return null;
    }
  }

  Future<bool?> updateUser(String name, String id) async {
    await firestore.collection('users').doc(id).update({'name':name});
    return true;
  }

  Future<bool?> updateProfilePhoto(String url, String id) async {
    await firestore.collection('users').doc(id).update({'profilePhoto':url});
    return true;
  }
}