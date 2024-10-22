import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/pages/controllers/note/note_controller.dart';
import 'package:note_app/routes/routes.dart';

class NotePage extends GetView<NoteController> {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note App'),
      ),
      body: GetBuilder<NoteController>(
        builder: (controller) => ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: Get.width,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Tooltip(
                          message: controller.listNote[index].title,
                          child: Text(
                            controller.listNote[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Tooltip(
                          message: controller.listNote[index].content,
                          child: Text(
                            controller.listNote[index].content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.titleController.text =
                            controller.listNote[index].title;
                        controller.contentController.text =
                            controller.listNote[index].content;
                        Get.bottomSheet(Container(
                          width: Get.width,
                          height: 300,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Nhap title',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 16),
                                  controller: controller.titleController,
                                ),
                                const SizedBox(height: 16),
                                SingleChildScrollView(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Nhap content',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    maxLines: 3,
                                    style: const TextStyle(fontSize: 16),
                                    controller: controller.contentController,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                    onPressed: () {
                                      controller.editNote(
                                          index,
                                          NoteModel(
                                              title: controller
                                                  .titleController.text,
                                              content: controller
                                                  .contentController.text));
                                      Get.back();
                                    },
                                    child: const Text('Sua'))
                              ],
                            ),
                          ),
                        ));
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        NoteModel noteModel = NoteModel(
                            title: controller.listNote[index].title,
                            content: controller.listNote[index].content);
                        controller.copyNote(index + 1, noteModel);
                      },
                      icon: const Icon(Icons.copy),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteNote(index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                )
              ],
            ),
          ),
          itemCount: controller.listNote.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addNote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
