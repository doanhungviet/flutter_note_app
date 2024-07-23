import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:note_app/pages/ui/note/add_note.dart';
import 'package:note_app/pages/ui/note/note.dart';
import 'package:note_app/pages/ui/note/note_binding.dart';


class Routes{
  static const note = '/';
  static const addNote = '/note/addNote';
}
class AppPages {
  static final routes = [
    GetPage(
      name: Routes.note,
      page: ()=> const NotePage(),
      binding: NoteBinding(),
    ),
    GetPage(
      name: Routes.addNote,
      page: ()=> const AddNote(),
      binding: NoteBinding(),
    ),
  ];
}