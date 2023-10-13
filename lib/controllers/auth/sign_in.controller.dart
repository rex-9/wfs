import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wfs/views/auth/forgot_pwd.view.dart';
import 'package:wfs/views/auth/sign_up.view.dart';
import 'package:wfs/views/others/support.view.dart';

class SignInController extends GetxController {
  final box = GetStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = false.obs;
  RxBool rememberMe = false.obs;

  @override
  void onInit() {
    rememberMe.value = box.read('rememberMe') ?? false;
    super.onInit();
  }

  void saveRememberMe(bool value) {
    rememberMe.value = value;
    box.write('rememberMe', value);
  }

  goToSupport() => Get.to(() => const SupportView());
  goToForgotPwd() => Get.to(() => const ForgotPwdView());
  goToSignUp() => Get.to(() => const SignUpView());

  void signIn() {
    print('Signing in...');
  }

  void googleSignIn() {
    print('Google sign in...');
  }

  void facebookSignIn() {
    print('Facebook sign in...');
  }
}
