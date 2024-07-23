import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
      body:
       GetBuilder<NoteController>(
           builder: (controller)=>
            ListView.separated(
             separatorBuilder: (context, index)=> SizedBox(height: 10,),
              itemBuilder: (context, index) => Container(
                width: Get.width,
                height: 100,
                color: Colors.red,
                child: Column(
                  children: [
                    Text(controller.listNote[index].title),
                    Text(controller.listNote[index].content),

                  ],
                ),
              ),
            itemCount: controller.listNote.length,
                   ),
         ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(Routes.addNote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
