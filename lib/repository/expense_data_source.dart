import 'package:dio/dio.dart';
import 'package:uang_saku/model/models.dart';

abstract class ExpenseDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
  Future<SingleResponse<String>> forgetPassword(String email);
  Future<SingleResponse<String>> verifyOtp(String email, String otp);
  Future<SingleResponse<String>> resetPassword(String email, String otp, String password);
  Future<SingleResponse<User>> getProfile();
}
