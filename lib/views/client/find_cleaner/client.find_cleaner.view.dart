import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wfs/helpers/components.dart';

class ClientFindCleanerView extends GetView {
  const ClientFindCleanerView({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultLayoutScaffold(
      appBar: appBar(title: 'Find a Cleaner'),
      body: const Center(
        child: Text('Find Cleaner'),
      ),
    );
  }
}
