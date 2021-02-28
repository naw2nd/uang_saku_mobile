import 'package:dio/dio.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/user.dart';

class HttpService {
  Dio _dio;
  Dio _dio2;

  final baseURL = "https://api.mocki.io/v1/";
  final baseURL2 = "http://128.199.208.102/api/v1/";

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: baseURL2));
    _dio2 = Dio(BaseOptions(baseUrl: baseURL));

    initalInterceptors();
  }

  Future<SingleResponse<User>> getProfile() async {
    String endPoint = "c0744d00";
    SingleResponse<User> singleResponseUser;
    try {
      Response response = await _dio2.get(endPoint);
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
      Response response = await _dio.post(endPoint, data: {"email": email});
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
          await _dio.post(endPoint, data: {"email": email, "otp": otp});
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
      Response response = await _dio.post(endPoint,
          data: {"email": email, "otp": otp, "password": password});
      print(response);
      singleResponse = SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return singleResponse;
  }

  initalInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error) {
      print(error.message);
    }, onRequest: (request) {
      print("${request.method} ${request.path}");
    }, onResponse: (response) {
      print(response.data);
    }));
  }
}
