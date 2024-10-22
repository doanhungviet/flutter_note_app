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

  final _listNote = Rx(<NoteModel>[]);
  List<NoteModel> get listNote => _listNote.value;

  void setName(){
    _chuoi.value = 'huy';
  }

  void countUp(){
    _count.value = _count.value ++;
  }

  void countDown(){
    _count.value = _count.value --;
  }

  Future<void> addNote(NoteModel noteModel) async {
    _listNote.value.add(noteModel);
    update();
  }

  void deleteNote(int index){
    _listNote.value.removeAt(index);
    update();
  }
  void editNote(int index,NoteModel noteModel){
    listNote[index] = noteModel;
    update();
  }
  void copyNote(int index,NoteModel noteModel){
    _listNote.value.add(noteModel);
    update();
  }
}