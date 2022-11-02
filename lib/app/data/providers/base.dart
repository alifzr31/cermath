import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BaseProvider {
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

  Future<Response> fetchGenders() async {
    await _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/gender'),
      headers: _setHeaders(),
    );
  }

  Future<Response> fetchUserTypes() async {
    await _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/usertype'),
      headers: _setHeaders(),
    );
  }

  Future<Response> fetchClass() async {
    await _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/class'),
      headers: _setHeaders(),
    );
  }
}
