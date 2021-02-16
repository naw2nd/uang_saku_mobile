import 'package:uang_saku/model/token.dart';
import 'package:uang_saku/model/single_response.dart';
import 'package:uang_saku/repository/expense_data_source.dart';
import 'package:uang_saku/repository/remote/remote_data_source.dart';
import 'package:uang_saku/repository/repositores.dart';

class ExpenseRepository implements ExpenseDataSource {
  RemoteDataSource remoteDataSource;

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
}
