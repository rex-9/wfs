import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/controllers/auth/sign_up.controller.dart';
import 'package:wfs/helpers/components.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return defaultLayoutScaffold(
      appBar: appBar(
        title: 'Sign Up',
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
                    controller: controller.firstNameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your first name!' : null,
                    decoration: inputDecoration(
                      hintText: 'Enter your first name',
                      label: 'First Name',
                      icon: Icons.person,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.lastNameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your last name!' : null,
                    decoration: inputDecoration(
                      hintText: 'Enter your last name',
                      label: 'Last Name',
                      icon: Icons.person,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                  submitBtn(
                    formKey: formKey,
                    func: () => controller.signUp(),
                    label: 'Create an account',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      linkBtn(
                        func: controller.goToSignIn,
                        label: 'Sign In',
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
