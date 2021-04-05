import 'package:uang_saku/model/kategori_pengajuan.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/reimburse.dart';
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
}
