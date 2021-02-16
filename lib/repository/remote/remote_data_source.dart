import 'package:uang_saku/model/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteDataSource {
  final http.Client httpClient;

  RemoteDataSource({this.httpClient});

  Future<SingleResponse<Token>> login(String email, String password) async {
    String url = "http://128.199.208.102/api/v1/login";
    var result = await httpClient
        .post(url, body: {"email": email, "password": password});
    print(result);
    var object = json.decode(result.body);
    if (object['data'] != null) {
      object['data'] = Token.fromJson(object['data']);
    }
    return SingleResponse.fromJson(object);
  }

  Future<SingleResponse<String>> forgetPassword(String email) async {
    String url = "http://128.199.208.102/api/v1/forgot-password";
    var result = await httpClient.post(url, body: {"email": email});
    var object = json.decode(result.body);

    return SingleResponse.fromJson(object);
  }

  Future<SingleResponse<String>> verifiyOTP(String email, String otp) async {
    String url = "http://128.199.208.102/api/v1/verify-otp";
    var result = await httpClient.post(url, body: {"email": email, "otp": otp});
    var object = json.decode(result.body);

    return SingleResponse.fromJson(object);
  }

  Future<SingleResponse<String>> resetPassword(
      String email, String otp, String password) async {
    String url = "http://128.199.208.102/api/v1/reset-password";
    var result = await httpClient
        .post(url, body: {"email": email, "otp": otp, "password": password});
    var object = json.decode(result.body);

    return SingleResponse.fromJson(object);
  }
}
