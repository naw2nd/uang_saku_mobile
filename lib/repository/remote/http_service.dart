import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/user.dart';
import 'package:intl/intl.dart';

class HttpService {
  Dio _dio;
  SharedPreferences sharedPreferences;
  String token = "";

  final baseURL = "http://192.168.1.8:8000/api/v1/";

  HttpService() {
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
        print("kene");
        SingleResponse singleResponse = SingleResponse.fromJson(response.data);
      if (singleResponse.success) {
        singleResponseToken = SingleResponse<Token>(
            success: singleResponse.success,
            message: singleResponse.message,
            data: Token.fromJson(singleResponse.data));
        print(singleResponseToken.data.token);
      } else {
        singleResponseToken = SingleResponse<Token>(
            success: singleResponse.success,
            message: singleResponse.message);
      }
    } on DioError catch (e) {
      print(e);
      // throw Exception(e.message);
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
        "nama_pegawai": user.namaPegawai,
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

  postReimburse(Reimburse reimburse) async {
    String endPoint = "reimburse";
    SingleResponse singleResponse;
    try {
      print("sini");
      Response response =
          await _dio.post(endPoint, data: {"tujuan": reimburse.tujuan});
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
      return error;
    }, onRequest: (request) {
      request.headers["Authorization"] = "Bearer " + token;
      print("${request.method} ${request.path}");
      return request;
    }, onResponse: (response) {
      // print(response.data);
      return response;
    }));
  }
}
