import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/category_selection.controller.dart';

class CategorySelectionScreen extends GetView<CategorySelectionController> {
  const CategorySelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategorySelectionScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CategorySelectionScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
