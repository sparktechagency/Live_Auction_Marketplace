import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/track_order.controller.dart';

class TrackOrderScreen extends GetView<TrackOrderController> {
  const TrackOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrackOrderScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrackOrderScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
