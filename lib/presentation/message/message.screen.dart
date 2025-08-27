import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/message.controller.dart';

class MessageScreen extends GetView<MessageController> {
  const MessageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MessageScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MessageScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
