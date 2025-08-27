import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/tools.controller.dart';

class ToolsScreen extends GetView<ToolsController> {
  const ToolsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToolsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ToolsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
