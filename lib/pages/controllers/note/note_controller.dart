import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:note_app/models/note_model.dart';

class NoteController extends GetxController{
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final RxString _chuoi = 'ngakezzy 123'.obs;
  String get chuoi => _chuoi.value;
  final RxInt _count = 0.obs;
  int get count => _count.value;

  var _listNote = Rx(<NoteModel>[]);
  List<NoteModel> get listNote => _listNote.value;

  void setName(){
    _chuoi.value = 'huy';
  }

  void countUp(){
    _count.value = _count.value ++;
    print(_count.value++);
  }

  void countDown(){
    _count.value = _count.value --;
    print(_count.value--);
  }

  Future<void> addNote(NoteModel noteModel) async {
_listNote.value.add(noteModel);
print(_listNote.value.length);
update();
  }
}