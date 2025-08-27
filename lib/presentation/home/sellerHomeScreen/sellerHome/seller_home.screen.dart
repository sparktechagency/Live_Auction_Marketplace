import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/seller_home.controller.dart';

class SellerHomeScreen extends GetView<SellerHomeController> {
  const SellerHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SellerHomeScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SellerHomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
