import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/helpers/components.dart';

class ClientPickLocationView extends GetView {
  const ClientPickLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultLayoutScaffold(
      appBar: appBar(title: 'Find a Driver'),
      body: const Center(
        child: Text('Location Pick'),
      ),
    );
  }
}
