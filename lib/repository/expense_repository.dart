import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/token.dart';
import 'package:uang_saku/model/single_response.dart';
import 'package:uang_saku/model/user.dart';
import 'package:uang_saku/repository/expense_data_source.dart';
import 'package:uang_saku/repository/remote/http_service.dart';
import 'package:uang_saku/repository/repositores.dart';

class ExpenseRepository implements ExpenseDataSource {
  // RemoteDataSource remoteDataSource;
  HttpService remoteDataSource;
  ExpenseRepository({this.remoteDataSource});

  @override
  Future<SingleResponse<Token>> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }

  @override
  Future<SingleResponse<String>> forgetPassword(String email) async {
    return await remoteDataSource.forgetPassword(email);
  }

  @override
  Future<SingleResponse<String>> resetPassword(
      String email, String otp, String password) async {
    return await remoteDataSource.resetPassword(email, otp, password);
  }

  @override
  Future<SingleResponse<String>> verifyOtp(String email, String otp) async {
    return await remoteDataSource.verifiyOTP(email, otp);
  }

  @override
  Future<SingleResponse<User>> getProfile() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getProfile();
  }

  @override
  Future<SingleResponse<String>> putUser(User user) async {
    remoteDataSource.getToken();
    return await remoteDataSource.putUser(user);
  }

  @override
  Future<SingleResponse> postPassword(String password) async {
    remoteDataSource.getToken();
    return await remoteDataSource.postPassword(password);
  }
  

  @override
  setToken(String token) {
    remoteDataSource.setToken(token);
  }

  @override
  getToken() {
    remoteDataSource.getToken();
  }

  @override
  logout() {
    remoteDataSource.logout();
  }

  @override
  Future<SingleResponse<Kasbon>> getKasbon() async {
   remoteDataSource.getToken();
   return await remoteDataSource.getKasbon();
  }

  @override
  Future<MultiResponse<Kasbon>> getListKasbon() async{
    remoteDataSource.getToken();
    return await remoteDataSource.getListKasbon();
  }

}
