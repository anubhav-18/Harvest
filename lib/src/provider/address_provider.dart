import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocers/src/features/models/user_model.dart';

class AddressProvider extends ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  Future<void> addAddress({
    required UserModel userModel,
    required Address address,
    required BuildContext context,
  }) async {
    try {
      if (userModel.uid.isNotEmpty) {
        await _fireStore
            .collection('users')
            .doc(userModel.uid)
            .collection('addresses')
            .add(
          {
            "label": address.label,
            "houseNo": address.houseNo,
            "floorNo": address.floorNo,
            "address1": address.address1,
            "address2": address.address2,
            "landmark": address.landmark,
          },
        );
      }
    } catch (e) {
      print("Error adding address: $e");
    }
  }

  Future<List<Address>> getUserAddressDataFromFirebase() async {
    List<Address> addresses = [];

    try {
      final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserUid != null) {
        QuerySnapshot addressSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserUid)
            .collection('addresses')
            .get();

        addresses = addressSnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Address(
          label: data['label'],
          houseNo: data['houseNo'],
          floorNo: data['floorNo'],
          address1: data['address1'],
          address2: data['address2'],
          landmark: data['landmark'],
        );
      }).toList();
      }
    } catch (e) {
      print('Error fetching user address data: $e');
    }

    return addresses;
  }
}
