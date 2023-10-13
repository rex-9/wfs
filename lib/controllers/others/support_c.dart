import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController issueController = TextEditingController();

  RxBool obscureText = false.obs;
  RxBool rememberMe = false.obs;

  submit() => print('Submit issue');
}
