import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/create_pengajuan_event.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/kategori_pengajuan.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/single_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class CreatePengajuanBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  CreatePengajuanBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is InitEvent) {
      yield (LoadingState());
      try {
        final MultiResponse<KategoriPengajuan> responseKategori =
            await expenseRepository.getKategori();

        final MultiResponse<Perusahaan> responsePerusahaan =
            await expenseRepository.getPerusahaan();

        final MultiResponse<Department> responseDepartment =
            await expenseRepository.getDepartment();

        final MultiResponse<Cabang> responseCabang =
            await expenseRepository.getCabang();

        yield (CreatePengajuanState(
            listKategori: responseKategori.data,
            listCabang: responseCabang.data,
            listDepartment: responseDepartment.data,
            listPerusahaan: responsePerusahaan.data));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
    if (event is CreateReimburseEvent) {
      yield (LoadingState());
      try {
        final SingleResponse response =
            await expenseRepository.postReimburse(event.reimburse);
        print(response.message);
        if (response.success) {
          yield SuccesState(data: response.data);
          print("berhasil");
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
    if (event is CreateKasbonEvent) {
      try {
        final SingleResponse response =
            await expenseRepository.postKasbon(event.kasbon);
        print(response.message);
        if (response.success) {
          yield SuccesState<String>(data: response.message);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
