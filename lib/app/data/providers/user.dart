// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserProvider {
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

  Future<Response> fetchUserById(String id) async {
    await _getToken();
    return client.get(
      Uri.parse('$baseUrl/api/users/$id'),
      headers: _setHeaders(),
    );
  }

  Future<Response> updateInformation(Map data, String id) async {
    await _getToken();
    return client.put(
      Uri.parse('$baseUrl/api/users/$id'),
      headers: _setHeaders(),
      body: data,
    );
  }

  Future<Response> updateProfile(Map data, String id) async {
    await _getToken();
    return client.put(
      Uri.parse('$baseUrl/api/users/changeProfile/$id'),
      headers: _setHeaders(),
      body: data,
    );
  }
}
