import 'package:get/get.dart';
import 'package:note_app/pages/controllers/note/note_controller.dart';

class NoteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController());
  }
}