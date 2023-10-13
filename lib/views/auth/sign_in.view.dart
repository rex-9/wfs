import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/controllers/auth/sign_in.controller.dart';
import 'package:wfs/helpers/components.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();

    return defaultLayoutScaffold(
      appBar: appBar(
        title: 'Sign In',
        action: linkBtn(func: controller.goToSupport, label: 'Support'),
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    validator: (value) => value!.isEmpty ||
                            !EmailValidator.validate(value.trim(), true)
                        ? 'Enter a valid Email!'
                        : null,
                    decoration: inputDecoration(
                      hintText: 'Enter your email',
                      label: 'Email',
                      icon: Icons.email,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.passwordController,
                    validator: (value) =>
                        value!.length < 6 ? 'Minimum of 6 digits!' : null,
                    obscureText: controller.obscureText.value,
                    decoration: inputDecoration(
                      hintText: 'Enter your password',
                      label: 'Password',
                      icon: Icons.key,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.obscureText.value =
                              !controller.obscureText.value;
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      linkBtn(
                        func: controller.goToForgotPwd,
                        label: 'Forgot Password?',
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: controller.rememberMe.value,
                            activeColor: ThemeData().primaryColor,
                            onChanged: (value) {
                              controller.saveRememberMe(value ?? false);
                            },
                          ),
                          const Text('Remember Me'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  submitBtn(
                    formKey: formKey,
                    func: () => controller.signIn(),
                    label: 'Sign In',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      linkBtn(
                        func: controller.goToSignUp,
                        label: 'Sign Up',
                      )
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 0.5,
                      color: Colors.black,
                    ),
                    const Text('Or Continue with'),
                    Container(
                      width: 100,
                      height: 0.5,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/google.png',
                      ),
                      onPressed: controller.googleSignIn,
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/facebook.png',
                      ),
                      onPressed: controller.facebookSignIn,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
