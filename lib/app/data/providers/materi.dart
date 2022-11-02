import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MateriProvider {
  var client = http.Client();
  var baseUrl = "https://cermath.tech:3000";
  var _token;

  _getToken() {
    final localStorage = GetStorage();
    var user = localStorage.read('user');
    _token = user['token'].toString();
  }

  _setHeaders() => {
        'accept': 'application/json',
        'Authorization': 'bearer $_token',
      };

  Future<Response> fetchMateri(String classId) async {
    _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/materi/lessonByClass/$classId'),
      headers: _setHeaders(),
    );
  }

  Future<Response> fetchSubMateri(String lessonId) async {
    _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/lesson/listsublesson/$lessonId'),
      headers: _setHeaders(),
    );
  }
}
