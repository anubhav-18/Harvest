// import 'package:get/get.dart';
// import 'package:grocers/src/repository/authentication_repo.dart';

// class OTPcontroller extends GetxController{

//   static OTPcontroller get instance => Get.find();

//   void verifyOtp(String otp) async {
//     var isVerified  = await AuthenticationRepository.instance.verifyOtp(otp);
//     isVerified ? Get.offAllNamed('/btmNav') : Get.back();
//   }
// }