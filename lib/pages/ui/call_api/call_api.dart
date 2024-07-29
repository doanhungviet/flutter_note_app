import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/pages/controllers/call_api/call_api.dart';

class CallApiPage extends GetView<CallApiController> {
  const CallApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CallApiController controller = Get.put(CallApiController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Call Example'),
      ),
      body: Center(
        child: Obx(
              () => ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: controller.listPosts.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(controller.listPosts[index]['title'] ?? 'No Title'),
                subtitle: Text(controller.listPosts[index]['body'] ?? 'No Body'),
              );
            },
          ),
        ),
      ),
    );
  }
}
