class UserModel {
  String firstName;
  String lastName;
  String email;
  String uid;
  String phoneNo;
  String createdAt;
  List? addresses;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.createdAt,
    this.addresses,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    List addresses = [];
    if (map['addresses'] != null) {
      for (var addressData in map['addresses']) {
        addresses.add(Address.fromMap(addressData));
      }
    }

    return UserModel(
      uid: map['uid'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      createdAt: map['createdAt'] ?? '',
      addresses: addresses,
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> addressesData = [];
    if (addresses != null) {
      for (var address in addresses!) {
        addressesData.add(address.toMap());
      }
    }
    return {
      "uid": uid,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNo": phoneNo,
      "createdAt": createdAt,
    };
  }
}

class Address {
  String label; // Home, Work, Other
  String houseNo;
  String floorNo;
  String address1;
  String address2;
  String landmark;

  Address({
    required this.label,
    required this.houseNo,
    required this.floorNo,
    required this.address1,
    required this.address2,
    required this.landmark,
  });

  // from map
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      label: map['label'] ?? '',
      houseNo: map['houseNo'] ?? '',
      floorNo: map['floorNo'] ?? '',
      address1: map['address1'] ?? '',
      address2: map['address2'] ?? '',
      landmark: map['landmark'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "label": label,
      "houseNo": houseNo,
      "floorNo": floorNo,
      "address1": address1,
      "address2": address2,
      "landmark": landmark,
    };
  }
}
