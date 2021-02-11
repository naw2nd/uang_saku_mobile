import 'package:uang_saku/model/models.dart';

abstract class ExpenseDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
  Future<SingleResponse<Token>> forgetPassword(String email);
  Future<SingleResponse<Token>> verifyOtp(String email, String password);
  Future<SingleResponse<Token>> resetPassword(
      String email, String otp, String password);
}
