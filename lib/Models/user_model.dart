import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String id;
  late final String companyName;
  late final String uid;

  UserModel(
      {this.email = "",
      this.firstName = "",
      this.lastName = "",
      this.id = "",
      this.companyName = "",
      this.uid = ""});

  UserModel copy(
          {String? email,
          String? firstName,
          String? lastName,
          String? id,
          String? companyName,
          String? uid}) =>
      UserModel(
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        id: id ?? this.id,
        companyName: companyName ?? this.companyName,
        uid: uid ?? this.uid,
      );

  // Constructor

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      id: map['id'],
      companyName: map['companyName'],
      uid: map['uid'],
    );
  }

  /*factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc.data()["id"],
      email: doc.data()['email'],
      firstName: doc.data()['firstName'],
      lastName: doc.data()['lastName'],
      companyName: doc.data()['companyName'],
      uid: doc.data()['uid'],
    );
  }*/

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
      'companyName': companyName,
      'uid': uid
    };
  }
}
