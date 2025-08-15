import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/product_selection.controller.dart';

class ProductSelectionScreen extends GetView<ProductSelectionController> {
  const ProductSelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductSelectionScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductSelectionScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
