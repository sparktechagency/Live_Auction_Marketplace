import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/log_in.controller.dart';

class LogInScreen extends GetView<LogInController> {
  const LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogInScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LogInScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
