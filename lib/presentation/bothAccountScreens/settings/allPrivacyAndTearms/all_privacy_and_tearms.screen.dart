import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/all_privacy_and_tearms.controller.dart';

class AllPrivacyAndTearmsScreen extends GetView<AllPrivacyAndTearmsController> {
  const AllPrivacyAndTearmsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllPrivacyAndTearmsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllPrivacyAndTearmsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
