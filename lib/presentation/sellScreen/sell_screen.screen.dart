import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/sell_screen.controller.dart';

class SellScreenScreen extends GetView<SellScreenController> {
  const SellScreenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SellScreenScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SellScreenScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
