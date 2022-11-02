import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class QuestionProvider {
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

  Future<Response> fetchListQuiz(String lessonId) async {
    await _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/lesson/listquiz/$lessonId'),
      headers: _setHeaders(),
    );
  }

  Future<Response> fetchQuestion(String quizId) async {
    await _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/materi/quiz/$quizId'),
      headers: _setHeaders(),
    );
  }
}
