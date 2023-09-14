// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;
//   final verificationId = ''.obs;

//   @override
//   void onReady() {
//     Future.delayed(const Duration(seconds: 5));
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, (callback) => _setInitalScreen);
//   }

//   _setInitalScreen(User? user) {
//     user == null ? Get.offAllNamed('/loginPage') : Get.toNamed('/btmNav');
//   }

//   void phoneAuth(String phoneNo) {
//     _auth.verifyPhoneNumber(
//         phoneNumber: phoneNo,
//         verificationCompleted: (_) async {
//           // await _auth.signInWithCredential(credential);
//         },
//         verificationFailed: (e) {
//           if (e.code == 'invalid-phone-number') {
//             Get.snackbar('Error', 'The Provide Phone Number is not Valid.');
//           } else {
//             Get.snackbar('Error', 'An unknown Error is occured');
//           }
//         },
//         codeSent: ((String verificationId, int? token) {
//           this.verificationId.value = verificationId;
//           Get.toNamed('/otpPage');
//         }),
//         codeAutoRetrievalTimeout: ((e) {
//           // this.verificationId.value = verificationId;
//           Get.snackbar('Error', 'Unknown Error');
//         }));
//   }

//   Future<bool> verifyOtp(String otp) async {
//     var credential = await _auth.signInWithCredential(
//         PhoneAuthProvider.credential(
//             verificationId: verificationId.value, smsCode: otp));
//     return credential.user != null ? true : false;
//   }

//   Future<void> logout() async => await _auth.signOut();
// }
