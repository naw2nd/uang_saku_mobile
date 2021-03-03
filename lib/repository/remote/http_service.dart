import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/user.dart';
import 'package:intl/intl.dart';

class HttpService {
  Dio _dio1;
  Dio _dio;
  SharedPreferences sharedPreferences;
  String token =
      ""; //"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMmRkMmQ2ODQ0NDNlM2M0NGQzOTdiN2JlNGMwYWRlODE2ZTlhZjRjOWExYTAyODEwYjY3MzdhMTBhOTVmOWZiMzAyMTYxNjAxMTFhNGRhNTMiLCJpYXQiOiIxNjE0NTMxODM1LjAwMjc5MiIsIm5iZiI6IjE2MTQ1MzE4MzUuMDAyNzk3IiwiZXhwIjoiMTY0NjA2NzgzNC4yNTEwOTIiLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.NQeDvNvq7SZ6cWcfgp-JiQh5CtuEru_cOj-x7XtxEUHYdln1SCT4Njb70RUJFpcuj6xqyz0fR3fCnDAO-fBw_PWFZOtmBTR-37w2MRc25z6PXWdIlRbQ_KessAI68XwofBDlCLcYZJhZ257-xflOyJq0c_Kd8Rj9avg7Q2c8nLseHYE7k-MiOhBb_6RlBv-6LtIayH1lgTobRjdD11qqARfJW-tBzDmw8qnhRIei1J-5VCD3v7Wd03hXJtxzlXpLdkXIYmmiDqJHRjNCB2zdXWftyXd0M9Bev7BMQ6nAP8N9K96j1-AoL7SL5BUZRxWylvyobsMuELCVzq-4kytZUiP1QMSUNWVLW8mLwpD19n7RyWM-wSyUud6ZuHrQdvKlwycK38eWl7cSqdeBMBvMidja6gFPbbhtEnP2hf5xJRdFn7igOonZNTOiA5XttBidScUGudVqV2jW6u27kJ2ztbTwEjG0QmAK4-XJxRzr-RVPY7fUbwu2BxiDCCHer7QC59aNoFdUnwAeFMXN9XNEglkvrS1ElsXXVWf9cmS4DCVxbgZUAkKluvf_mApJRgHh26OFZ25B7UogRSaz6M4YcmqNnwh6QADxQlKeEbI2uYoKxWL2leP_KL_Zc8FGLcMkk6K6WzcxT-cFCN0sjCTDBAyHVK5xGZXvI9ZZMWKcTG0";

  final baseURL = "http://192.168.137.18:8000/api/v1/";
  final baseURL1 = "http://128.199.208.102/api/v1/";

  HttpService() {
    _dio1 = Dio(BaseOptions(baseUrl: baseURL1));
    _dio = Dio(BaseOptions(baseUrl: baseURL));

    initalInterceptors();
  }

  setToken(String token) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
  }

  getToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    this.token = sharedPreferences.getString("token");
  }

  Future<SingleResponse<Token>> login(String email, String password) async {
    String endPoint = "login";
    SingleResponse<Token> singleResponseToken;
    try {
      Response response = await _dio
          .post(endPoint, data: {"email": email, "password": password});
      print(response);
      SingleResponse singleResponse = SingleResponse.fromJson(response.data);
      singleResponseToken = SingleResponse<Token>(
          success: singleResponse.success,
          message: singleResponse.message,
          data: Token.fromJson(singleResponse.data));
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return singleResponseToken;
  }

  Future<SingleResponse<String>> forgetPassword(String email) async {
    String endPoint = "forgot-password";
    SingleResponse<String> singleResponse;
    try {
      Response response = await _dio1.post(endPoint, data: {"email": email});
      print(response);
      singleResponse = SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return singleResponse;
  }

  Future<SingleResponse<String>> verifiyOTP(String email, String otp) async {
    String endPoint = "verify-otp";
    SingleResponse<String> singleResponse;
    try {
      Response response =
          await _dio1.post(endPoint, data: {"email": email, "otp": otp});
      print(response);
      singleResponse = SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return singleResponse;
  }

  Future<SingleResponse<String>> resetPassword(
      String email, String otp, String password) async {
    String endPoint = "reset-password";
    SingleResponse<String> singleResponse;
    try {
      Response response = await _dio1.post(endPoint,
          data: {"email": email, "otp": otp, "password": password});
      print(response);
      singleResponse = SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return singleResponse;
  }

  Future<SingleResponse<User>> getProfile() async {
    String endPoint = "user";
    SingleResponse<User> singleResponseUser;

    try {
      Response response = await _dio.get(endPoint);
      print(response);
      SingleResponse singleResponse = SingleResponse.fromJson(response.data);
      singleResponseUser = SingleResponse<User>(
          success: singleResponse.success,
          message: singleResponse.message,
          data: User.fromJson(singleResponse.data));
      print(singleResponseUser.data.username);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return singleResponseUser;
  }

  Future<SingleResponse<String>> putUser(User user) async {
    String endPoint = "user";
    SingleResponse<String> singleResponse;
    try {
      Response response = await _dio.put(endPoint, data: {
        "username": user.username,
        "nama_pegawai": user.nama,
        "email": user.email,
        "alamat": user.alamat,
        "no_telp": user.noTelp,
        "tempat_lahir": user.tempatLahir,
        "tgl_lahir": DateFormat('yyyy-MM-dd – kk:mm').format(user.tglLahir),
      });
      print(response);
      singleResponse = SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return singleResponse;
  }

  Future<SingleResponse> postPassword(String password) async {
    String endPoint = "change-password";
    SingleResponse singleResponse;
    try {
      Response response =
          await _dio.post(endPoint, data: {"password": password});
      print(response);
      singleResponse = SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return singleResponse;
  }

  logout() async {
    await sharedPreferences.clear();
  }

  initalInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error) {
      print(error.message);
    }, onRequest: (request) {
      request.headers["Authorization"] = "Bearer " + token;
      print("${request.method} ${request.path}");
    }, onResponse: (response) {
      // print(response.data);
    }));
  }
}
