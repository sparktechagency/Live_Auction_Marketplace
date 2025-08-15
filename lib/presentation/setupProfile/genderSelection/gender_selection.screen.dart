import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/gender_selection.controller.dart';

class GenderSelectionScreen extends GetView<GenderSelectionController> {
  const GenderSelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenderSelectionScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GenderSelectionScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
