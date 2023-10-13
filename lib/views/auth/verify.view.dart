import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/controllers/auth/verify.controller.dart';
import 'package:wfs/helpers/components.dart';

class VerifyView extends GetView {
  final String email;
  const VerifyView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyController());
    final formKey = GlobalKey<FormState>();

    return defaultLayoutScaffold(
      appBar: appBar(title: 'Verify OTP'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                'We send a code to',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  color: ThemeData().primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: TextFormField(
              controller: controller.otpController,
              validator: (value) => value!.isEmpty ? 'Enter your OTP!' : null,
              decoration: inputDecoration(
                hintText: 'Enter your OTP code',
                label: 'OTP Code',
                icon: Icons.keyboard_alt_outlined,
              ),
            ),
          ),
          Column(
            children: [
              submitBtn(
                formKey: formKey,
                func: () => controller.submit(),
                label: 'Submit',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive a code?"),
                  linkBtn(
                    func: controller.resendOtp,
                    label: 'Resend',
                  )
                ],
              ),
            ],
          ),
          Container(
            color: Colors.red[50],
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: const IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 20,
                    color: Colors.red,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'OTP you entered was wrong. \n Please enter the correct OTP.',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
