import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uang_saku/model/list_kasbon.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/role_approval.dart';
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
            success: singleResponse.success, message: singleResponse.message);
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

  Future<SingleResponse<Kasbon>> getKasbon() async {
    String endPoint = "kasbon/1";
    SingleResponse<Kasbon> singleResponseKasbon;
    try {
      Response response = await _dio.get(endPoint);
      print(response);
      SingleResponse singleResponse = SingleResponse.fromJson(response.data);
      singleResponseKasbon = SingleResponse<Kasbon>(
          success: singleResponse.success,
          message: singleResponse.message,
          data: Kasbon.fromJson(singleResponse.data));
      print(singleResponseKasbon.message);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return singleResponseKasbon;
  }

  Future<MultiResponse<Kasbon>> getListKasbon() async {
    String endpoint = "kasbon";
    try {
      Response response = await _dio.get(endpoint);
      response.data["properties"] = Properties.fromJson(response.data);
      response.data["data"] = List<Kasbon>.from(
          response.data["data"].map((x) => Kasbon.fromJson(x)));
      MultiResponse<Kasbon> multiResponse =
          MultiResponse.fromJson(response.data);
      return multiResponse;
    } on DioError catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }

  logout() async {
    await sharedPreferences.clear();
  }

  Future<SingleResponse<Kasbon>> deleteKasbon(int id, String catatan) async {
    String endpoint = "kasbon/1/cancel";
    SingleResponse<Kasbon> singleResponseKasbon;

    try {
      Response response =
          await _dio.post(endpoint, data: {"catatan": "sembarang", "id": 2});
      print(response.data);
      SingleResponse singleResponse = SingleResponse.fromJson(response.data);

      singleResponseKasbon = SingleResponse<Kasbon>(
          success: singleResponse.success,
          message: singleResponse.message,
          data: Kasbon.fromJson(singleResponse.data));
    } on DioError catch (e) {
      print(e);
      throw Exception(e);
    } catch (e) {
      print(e);
    }

    return singleResponseKasbon;
  }

  Future<MultiResponse<KategoriPengajuan>> getKategori() async {
    String endPoint = "kategori-pengajuan";
    try {
      Response response = await _dio.get(endPoint);
      response.data["data"] = List<KategoriPengajuan>.from(
          response.data["data"].map((x) => KategoriPengajuan.fromJson(x)));
      MultiResponse<KategoriPengajuan> multiResponse =
          MultiResponse.fromJson(response.data);
      return multiResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<MultiResponse<Perusahaan>> getPerusahaan() async {
    String endPoint = "perusahaan";
    try {
      Response response = await _dio.get(endPoint);
      response.data["data"] = List<Perusahaan>.from(
          response.data["data"].map((x) => Perusahaan.fromJson(x)));
      MultiResponse<Perusahaan> multiResponse =
          MultiResponse.fromJson(response.data);
      return multiResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<MultiResponse<Cabang>> getCabang() async {
    String endPoint = "cabang";
    try {
      Response response = await _dio.get(endPoint);
      response.data["data"] = List<Cabang>.from(
          response.data["data"].map((x) => Cabang.fromJson(x)));
      MultiResponse<Cabang> multiResponse =
          MultiResponse.fromJson(response.data);
      return multiResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<MultiResponse<KategoriBiaya>> getKategoriBiaya() async {
    String endPoint = "kategori-biaya";
    try {
      Response response = await _dio.get(endPoint);
      response.data["data"] = List<KategoriBiaya>.from(
          response.data["data"].map((x) => KategoriBiaya.fromJson(x)));
      MultiResponse<KategoriBiaya> multiResponse =
          MultiResponse.fromJson(response.data);
      return multiResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<SingleResponse> postReimburse(Reimburse reimburse) async {
    String endPoint = "reimburse";
    try {
      Response response = await _dio.post(endPoint, data: reimburse.toJson());
      print(response);
      print(response.data);
      return SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<SingleResponse> postKasbon(Kasbon kasbon) async {
    String endPoint = "kasbon";
    try {
      Response response = await _dio.post(endPoint, data: kasbon.toJson());
      return SingleResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<MultiResponse<RoleApproval>> getRoleApproval() async {
    String endPoint = "approval";
    try {
      Response response = await _dio.get(endPoint);
      response.data["data"] = List<RoleApproval>.from(
          response.data["data"].map((x) => RoleApproval.fromJson(x)));
      MultiResponse<RoleApproval> multiResponse =
          MultiResponse.fromJson(response.data);
      return multiResponse;
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<MultiResponse<Reimburse>> getApprovalReimburse(
      int idRoleApproval, BodyApproval bodyApproval) async {
    String endpoint = "reimburse/approval/${idRoleApproval.toString()}";
    try {
      Response response =
          await _dio.get(endpoint, queryParameters: bodyApproval.toJson());
      response.data["properties"] = Properties.fromJson(response.data);
      response.data["data"] = List<Reimburse>.from(
          response.data["data"].map((x) => Reimburse.fromJson(x)));
      MultiResponse<Reimburse> multiResponse =
          MultiResponse.fromJson(response.data);
      return multiResponse;
    } on DioError catch (e) {
      print(e);
      throw Exception(e.message);
    }
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
