import 'package:uang_saku/model/body_post_approval.dart';
import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/model/laporan.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/kategori_pengajuan.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/reimburse.dart';
import 'package:uang_saku/model/role_approval.dart';
import 'package:uang_saku/model/token.dart';
import 'package:uang_saku/model/single_response.dart';
import 'package:uang_saku/model/user.dart';
import 'package:uang_saku/repository/expense_data_source.dart';
import 'package:uang_saku/repository/remote/http_service.dart';
import 'package:uang_saku/repository/repositores.dart';

class ExpenseRepository implements ExpenseDataSource {
  HttpService remoteDataSource;
  ExpenseRepository({this.remoteDataSource});

  @override
  Future<SingleResponse<Token>> login(String email, String password) async {
    return await remoteDataSource.login(email, password);
  }

  Future<SingleResponse<String>> postFcmToken(String token) async {
    remoteDataSource.getToken();
    return await remoteDataSource.postFcmToken(token);
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
  Future<SingleResponse> cancelKasbon(int id, String catatan) async {
    remoteDataSource.getToken();
    return await remoteDataSource.cancelKasbon(id, catatan);
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
  Future<SingleResponse<Kasbon>> getKasbon(int id) async {
    remoteDataSource.getToken();
    return await remoteDataSource.getKasbon(id);
  }

  @override
  Future<SingleResponse<Reimburse>> getReimburse(int id) async {
    remoteDataSource.getToken();
    return await remoteDataSource.getReimburse(id);
  }

  @override
  Future<MultiResponse<Kasbon>> getListKasbon() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getListKasbon();
  }

  @override
  Future<MultiResponse<Reimburse>> getListReimburse() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getListReimburse();
  }

  Future<MultiResponse<KategoriPengajuan>> getKategori() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getKategori();
  }

  @override
  Future<MultiResponse<Perusahaan>> getPerusahaan() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getPerusahaan();
  }

  @override
  Future<MultiResponse<Department>> getDepartment() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getDepartment();
  }

  @override
  Future<MultiResponse<Cabang>> getCabang() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getCabang();
  }

  @override
  Future<MultiResponse<KategoriBiaya>> getKategoriBiaya() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getKategoriBiaya();
  }

  @override
  Future<SingleResponse> postReimburse(Reimburse reimburse) async {
    remoteDataSource.getToken();
    return await remoteDataSource.postReimburse(reimburse);
  }

  @override
  Future<SingleResponse> postKasbon(Kasbon kasbon) async {
    remoteDataSource.getToken();
    return await remoteDataSource.postKasbon(kasbon);
  }

  @override
  Future<SingleResponse> postLaporan(Laporan laporan, int idPengajuanKasbon) async {
    remoteDataSource.getToken();
    return await remoteDataSource.postLaporan(laporan, idPengajuanKasbon);
  }

  @override
  Future<SingleResponse> putReimburse(Reimburse reimburse, int id) async {
    remoteDataSource.getToken();
    return await remoteDataSource.putReimburse(reimburse, id);
  }

  @override
  Future<SingleResponse> putKasbon(Kasbon kasbon, int id) async {
    remoteDataSource.getToken();
    return await remoteDataSource.putKasbon(kasbon, id);
  }

  @override
  Future<MultiResponse<RoleApproval>> getRoleApproval() async {
    remoteDataSource.getToken();
    return await remoteDataSource.getRoleApproval();
  }

  @override
  Future<MultiResponse<Reimburse>> getApprovalReimburse(
      int idRoleApproval, BodyGetApproval bodyApproval) async {
    remoteDataSource.getToken();
    return await remoteDataSource.getApprovalReimburse(
        idRoleApproval, bodyApproval);
  }

  @override
  Future<MultiResponse<Kasbon>> getApprovalKasbon(
      int idRoleApproval, BodyGetApproval bodyApproval) async {
    remoteDataSource.getToken();
    return await remoteDataSource.getApprovalKasbon(
        idRoleApproval, bodyApproval);
  }

  @override
  Future<SingleResponse> postApprovalKasbon(
      int idRoleApproval, BodyPostApproval bodyApproval) async {
    remoteDataSource.getToken();
    return await remoteDataSource.postApprovalKasbon(
        idRoleApproval, bodyApproval);
  }

  @override
  Future<SingleResponse> postApprovalReimburse(
      int idRoleApproval, BodyPostApproval bodyApproval) async {
    remoteDataSource.getToken();
    return await remoteDataSource.postApprovalReimburse(
        idRoleApproval, bodyApproval);
  }
}
