import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? id;
  String? email;
  String? name;
  String? phoneNumber;
  String? profilePhoto;
  //MyMap? myMap;
  //List? liste;
  //Timestamp? degerim;



  UserModel(
      {this.email,this.id,this.name,this.phoneNumber,this.profilePhoto});
  //UserModel({this.email,this.id,this.name,this.phoneNumber,this.myMap,this.liste,this.degerim});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json['email'],
    phoneNumber: json['phoneNumber'],
    id: json['id'],
    name: json['name'],
    profilePhoto: json['profilePhoto'],
  );

  factory UserModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> source)=>
      UserModel.fromJson(source.data()!);
}




/*
    //degerim: json['degerim'],
    //liste:List<int>.from(json['liste']) ,
    //myMap:MyMap.fromJson(json["myMap"]),


class MyMap{
  var id;
  var school;

  MyMap({this.id,this.school});


  factory MyMap.fromJson(Map<String, dynamic> json) => MyMap(
    id: json['id'],
    school: json['school'],
  );
}

 */