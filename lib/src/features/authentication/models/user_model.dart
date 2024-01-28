import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  String email;
  String password;
  String fullName;
  String phoneNo;
  String id;
  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  Map<String, dynamic> toJson() {
    return {
      "FullName":fullName,
      "Email":email,
      "Phone":phoneNo,
      "Password":password,
    };
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data= document.data()!;
    return UserModel(
      id: document.id,
      email: data['email'],
      password: data['password'],
      fullName: data['name'],
      phoneNo: data['phone'],
    );
  }
}
