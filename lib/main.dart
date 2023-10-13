import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/views/client/client.dashboard.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: const Color(0xFF4A49EB),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: ClientDashboardView(),
        // body: VerifyView(email: 'haha@gmail.com'),
        // body: OnboardView(),
      ),
    );
  }
}
