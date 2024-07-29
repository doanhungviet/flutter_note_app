import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppService {
  static Future<List> getPosts() async {
    var uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    List result = [];
    try {
      final response = await http.get(uri);

      switch (response.statusCode) {
        case 200:
          var data = jsonDecode(response.body);
          result = data;
          break;
        case 400:
          var data = jsonDecode(response.body);
          result = data;
          break;
        case 401:
          var data = jsonDecode(response.body);
          result = data;
          break;
        case 404:
          var data = jsonDecode(response.body);
          result = data;
          break;
        default:
          var data = jsonDecode(response.body);
          result = data;
      }

      return result;
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
