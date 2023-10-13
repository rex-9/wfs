import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/views/auth/sign_in.view.dart';
import 'package:wfs/views/auth/verify.view.dart';
import 'package:wfs/views/others/support.view.dart';

class SignUpController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = false.obs;

  goToSupport() => Get.to(() => const SupportView());
  goToSignIn() => Get.to(() => const SignInView());
  goToVerify() => Get.to(() => VerifyView(email: emailController.text));

  void signUp() {
    print('Signing up...');
    goToVerify();
  }

  void googleSignIn() {
    print('Google sign in...');
  }

  void facebookSignIn() {
    print('Facebook sign in...');
  }
}
