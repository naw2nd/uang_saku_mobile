import 'package:uang_saku/model/body_post_approval.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/role_approval.dart';

abstract class ExpenseDataSource {
  Future<SingleResponse<Token>> login(String email, String password);
  Future<SingleResponse<String>> forgetPassword(String email);
  Future<SingleResponse<String>> verifyOtp(String email, String otp);
  Future<SingleResponse<String>> resetPassword(
      String email, String otp, String password);
  Future<SingleResponse<User>> getProfile();
  Future<SingleResponse<String>> putUser(User user);
  Future<SingleResponse> postPassword(String password);
  Future<SingleResponse<Kasbon>> getKasbon(int id);
  Future<SingleResponse<Reimburse>> getReimburse(int id);
  Future<MultiResponse<Kasbon>> getListKasbon();
  Future<MultiResponse<Reimburse>> getListReimburse();
  Future<SingleResponse<Kasbon>> deleteKasbon(int id, String catatan);
  setToken(String token);
  getToken();
  logout();
  Future<MultiResponse<KategoriPengajuan>> getKategori();
  Future<MultiResponse<Perusahaan>> getPerusahaan();
  Future<MultiResponse<Department>> getDepartment();
  Future<MultiResponse<Cabang>> getCabang();
  Future<MultiResponse<KategoriBiaya>> getKategoriBiaya();
  Future<SingleResponse> postReimburse(Reimburse reimburse);
  Future<SingleResponse> postKasbon(Kasbon kasbon);
  Future<MultiResponse<RoleApproval>> getRoleApproval();
  Future<MultiResponse<Reimburse>> getApprovalReimburse(
      int idRoleApproval, BodyGetApproval bodyApproval);
  Future<MultiResponse<Kasbon>> getApprovalKasbon(
      int idRoleApproval, BodyGetApproval bodyApproval);
  Future<SingleResponse> postApprovalKasbon(
      int idRoleApproval, BodyPostApproval bodyApproval);
  Future<SingleResponse> postApprovalReimburse(
      int idRoleApproval, BodyPostApproval bodyApproval);
}
