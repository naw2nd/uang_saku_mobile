import 'package:dio/dio.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/user.dart';

class HttpService {
  Dio _dio;

  final baseURL = "https://api.mocki.io/";

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: baseURL));

    initalInterceptors();
  }

  Future<SingleResponse<User>> getProfile() async {
    String endPoint = "v1/c0744d00";
    SingleResponse<User> singleResponseUser;
    try {
      Response response = await _dio.get(endPoint);
      SingleResponse singleResponse = SingleResponse.fromJson(response.data);
      User user = User.fromJson(singleResponse.data);
      singleResponseUser = SingleResponse<User>(success: singleResponse.success, message: singleResponse.message, data: user);
      print(singleResponseUser.data.username);    
    } on DioError catch (e) {
          print(e.message);
          throw Exception(e.message);
    }

    return singleResponseUser;
  }

  initalInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error) {
        print(error.message);
      },
      onRequest: (request) {
        print("${request.method} ${request.path}");
      },
      onResponse:  (response){
        print(response.data);
      }
    ));
  }
}
