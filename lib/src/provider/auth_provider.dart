import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocers/src/features/screens/login_view/otp_view.dart';
import 'package:grocers/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  AuthProvider() {
    checkSignIn();
  }

  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool('is_Signin') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('is_Signin', true);
    _isSignedIn = true;
    notifyListeners();
  }

  void signInWithPhone(
      BuildContext context, String phoneNo, String phoneController) async {
    try {
      _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNo,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPScreen(
                  verificationId: verificationId,
                  phoneController: phoneController,
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection('users').doc(_uid).get();
    if (snapshot.exists) {
      //user exists
      print('USER EXISTS');
      return true;
    } else {
      // new user
      print('NEW USER');
      return false;
    }
  }

  // Future<bool> checkUserAddress(BuildContext context) async {
  //   final userDoc = await _firebaseFirestore
  //       .collection('users')
  //       .doc(_firebaseAuth.currentUser!.uid)
  //       .get();
  //   if (userDoc.exists) {
  //     final userAddress = userDoc.data()?['address'];
  //     if (userAddress == null || userAddress.isEmpty) {
  //       return false;
  //     } else {
  //       return true;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
      userModel.phoneNo = _firebaseAuth.currentUser!.phoneNumber!;
      userModel.uid = _firebaseAuth.currentUser!.phoneNumber!;

      _userModel = userModel;

      await _firebaseFirestore
          .collection('users')
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      _userModel = UserModel(
        uid: uid,
        firstName: snapshot['firstName'],
        lastName: snapshot['lastName'],
        email: snapshot['email'],
        phoneNo: snapshot['phoneNo'],
        createdAt: snapshot['createdAt'],
        // addresses: snapshot['addresses'],
      );
      _uid = userModel.uid;
    });
    return _userModel;
  }

  Future saveUserDataToSP() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("user_model", jsonEncode(userModel.toMap()));
  }

  Future getDataFromSP() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String data = sp.getString("user_model") ?? "";
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }

  Future signOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    sp.clear();
    print('Logout Succesfully');
  }

  Future updateDataProfileData({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String email,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      Map<String, dynamic> userModel = {
        "firstName": firstname,
        "lastName": lastname,
        "email": email
      };
      await _firebaseFirestore
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update(userModel)
          .then((value) => saveUserDataToSP())
          .whenComplete(
        () {
          showSnackBar(context, 'Profile Updated Succesfully');
        },
      );
      _isLoading = false;
      notifyListeners();
      print('Data is Updated');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      print("Data is Not Updated");
      _isLoading = false;
      notifyListeners();
    }
  }
}
