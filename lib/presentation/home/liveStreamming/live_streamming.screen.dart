import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/live_streamming.controller.dart';

class LiveStreammingScreen extends GetView<LiveStreammingController> {
  const LiveStreammingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LiveStreammingScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LiveStreammingScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
