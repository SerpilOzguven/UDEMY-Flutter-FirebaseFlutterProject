import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/user_model.dart';


class UserService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserModel?> saveUser(
      String? email, String name,String uid,{isEmail})async{
    await firestore.collection('users').doc(uid).set({
      isEmail == false ? 'phoneNumber': 'email':email,'name':name,'id':uid});
    var source = firestore.collection('users').doc(uid).get();
    return UserModel.fromDoc(source);

  }
  Future<UserModel?> readUser(String uid)async{
    var source = firestore.collection('users').doc(uid).get();
    return UserModel.fromDoc(source);
}

  Future<UserModel?> userController(String uid)async{
    var source = await firestore.collection('users').doc(uid).get();
    if(source.data() != null){
      return readUser(uid);
    }else{
      return null;
    }

  }
  Future<bool?> update(String name)async{
    var isResult = await firestore.collection('users').doc(id).update({'name':name,});
    return true;

  }




}