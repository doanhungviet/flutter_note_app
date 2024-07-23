import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/pages/controllers/note/note.dart';

class AddNote extends GetView<NoteController> {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Container(
        child: Column(
          children: [
             TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                hintText: 'Nhap tieu de',
              ),
            ),
            const SizedBox(height: 20,),
             TextField(
              controller: controller.contentController,
              decoration: InputDecoration(
                  hintText: 'Nhap noi dung'
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  controller.addNote(
                    NoteModel(
                        title: controller.titleController.text,
                        content: controller.contentController.text
                    )
                  );
                },
                child: const Text('Them')
            )
          ],
        ),
      ),
    );
  }
}
