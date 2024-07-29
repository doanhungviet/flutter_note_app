import 'package:get/get.dart';
import 'package:note_app/pages/controllers/call_api/call_api_controller.dart';

class CallApiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CallApiController());
  }
}