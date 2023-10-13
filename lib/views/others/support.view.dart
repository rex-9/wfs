import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wfs/controllers/others/support_c.dart';
import 'package:wfs/helpers/components.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportController());
    final formKey = GlobalKey<FormState>();
    return defaultLayoutScaffold(
      appBar: appBar(title: 'Support'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 0),
          Column(
            children: [
              Image.asset(
                'assets/images/support.png',
              ),
              const SizedBox(height: 20),
              const Text(
                'How Can We Help You?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please fill out your name' : null,
                  decoration: inputDecoration(
                    hintText: 'Enter your Name',
                    label: 'Name',
                    icon: Icons.person,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.emailController,
                  validator: (value) => value!.isEmpty ||
                          !EmailValidator.validate(value.trim(), true)
                      ? 'Please enter a valid email'
                      : null,
                  decoration: inputDecoration(
                    hintText: 'Enter your email',
                    label: 'Email',
                    icon: Icons.email,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.issueController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please fill out the issue' : null,
                  decoration: inputDecoration(
                    hintText: 'Enter your Issue',
                    label: 'Issue',
                    icon: Icons.edit_document,
                  ),
                ),
                const SizedBox(height: 20),
                submitBtn(
                  formKey: formKey,
                  func: controller.submit,
                  label: 'Submit',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                const TextSpan(
                  text:
                      'If you would like to get immediate contact, \n please reach out to ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '+971-299-290-20',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse('tel:+97129929020'));
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
