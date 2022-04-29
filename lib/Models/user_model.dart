class UserModel {
  String ? firstName;
  String ? lastName;
  String ? id;
  String ? companyName;
  String ? gender;
  String ? uid;

  // Constructor
  UserModel({this.firstName, this.lastName, this.id, this.companyName, this.gender, this.uid});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      id: map['id'],
      companyName: map['companyName'],
      gender: map['gender'],
      uid: map['uid'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lasyName': lastName,
      'id': uid,
      'companyName': companyName,
      'gender': gender,
    };
  }
}