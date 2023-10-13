import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/helpers/components.dart';
import 'package:wfs/views/auth/sign_in.view.dart';
import 'package:wfs/views/auth/sign_up.view.dart';

class OnboardView extends GetView {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    goToSignUp() => Get.to(() => const SignUpView());
    goToSignIn() => Get.to(() => const SignInView());

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              primaryBtn(func: goToSignIn, label: 'Sign In'),
              secondaryBtn(func: goToSignUp, label: 'Sign Up'),
            ],
          ),
        ],
      ),
    );
  }
}
