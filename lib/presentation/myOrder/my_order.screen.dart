import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/my_order.controller.dart';

class MyOrderScreen extends GetView<MyOrderController> {
  const MyOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyOrderScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyOrderScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
