import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/categories.controller.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoriesScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CategoriesScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
