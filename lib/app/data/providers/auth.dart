// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthProvider {
  var client = http.Client();
  var baseUrl = "https://cermath.tech:3000";

  Future<Response> login(Map data) => client.post(
        Uri.parse('$baseUrl/api/login'),
        body: data,
      );

  Future<Response> register(Map data) =>
      client.post(Uri.parse('$baseUrl/api/users'), body: data);
}
