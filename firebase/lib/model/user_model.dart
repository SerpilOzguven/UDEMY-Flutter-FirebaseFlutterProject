class UserModel{
  var id;
  var email;

  UserModel({this.email});

  factory UserModel.fromJason(Map<String, dynamic> json) => UserModel(
    email: json['email']);
}