import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';

abstract class ExpenseDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
  Future<SingleResponse<String>> forgetPassword(String email);
  Future<SingleResponse<String>> verifyOtp(String email, String otp);
  Future<SingleResponse<String>> resetPassword(String email, String otp, String password);
  Future<SingleResponse<User>> getProfile();
  Future<SingleResponse<String>> putUser(User user);
  Future<SingleResponse> postPassword(String password);
  setToken(String token);
  getToken();
  logout();
  Future<MultiResponse<KategoriPengajuan>> getKategori();
  Future<MultiResponse<Perusahaan>> getPerusahaan();
  Future<MultiResponse<Cabang>> getCabang();
  Future<MultiResponse<KategoriBiaya>> getKategoriBiaya();
  Future<SingleResponse> postReimburse(Reimburse reimburse);
}
