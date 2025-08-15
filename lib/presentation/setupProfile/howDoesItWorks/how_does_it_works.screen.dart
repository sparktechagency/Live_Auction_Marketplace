import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/how_does_it_works.controller.dart';

class HowDoesItWorksScreen extends GetView<HowDoesItWorksController> {
  const HowDoesItWorksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HowDoesItWorksScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HowDoesItWorksScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
