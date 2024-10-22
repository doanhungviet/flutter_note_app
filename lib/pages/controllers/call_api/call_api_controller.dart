import 'package:get/get.dart';
import 'package:note_app/services/services.dart';

class CallApiController extends GetxController {
  final postBody = ''.obs;
  final Rx<List<Map<String, dynamic>>> _listPosts = Rx<List<Map<String, dynamic>>>([]);
  List<Map<String, dynamic>> get listPosts => _listPosts.value;

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    final List res = await AppService.getPosts();
    if (res.isNotEmpty) {
      _listPosts.value = List<Map<String, dynamic>>.from(res);
      postBody.value = res[0]['body'];
    }
  }
}
