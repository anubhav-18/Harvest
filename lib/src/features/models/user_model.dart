class UserModel {
  String firstName;
  String lastName;
  String email;
  String uid;
  String phoneNo;
  String createdAt;
  // String address;
  // String gender;
  // String dob;
  

  UserModel(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNo,
      required this.createdAt,
      // required this.address
      // required this.gender,
      // required this.dob
      });

  // from map 
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      createdAt: map['createdAt'] ?? '',
      // address: map['address'] ?? '',
      // gender:  map['gender'] ?? '',
      // dob:  map['dob'] ?? '',
    );
  }

  // to map 
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNo": phoneNo,
      "createdAt": createdAt,
      // "address": address,
      // "gender": gender,
      // "dob": dob , 
    };
  }
}
