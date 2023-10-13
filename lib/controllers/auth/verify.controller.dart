import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/views/client/client.dashboard.view.dart';

class VerifyController extends GetxController {
  // RxString otp = ''.obs;
  TextEditingController otpController = TextEditingController();

  goToClientDashboard() => Get.offAll(() => const ClientDashboardView());

  bottomSheet() => Get.bottomSheet(
        Container(
          height: Get.height,
          color: Colors.white,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_sharp,
                  color: Colors.green,
                  size: 32,
                ),
                SizedBox(height: 20),
                Text(
                  'Your registeration has been finished.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        isScrollControlled: true,
      );

  void submit() {
    print('Verifying code ...');
    bottomSheet();
    // Redirect to another page after showing the bottom sheet
    Future.delayed(const Duration(seconds: 2), () {
      goToClientDashboard();
    });
  }

  void resendOtp() {
    print('Resending code ...');
  }
}
