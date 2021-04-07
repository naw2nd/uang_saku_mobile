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
      try {
        final MultiResponse<KategoriPengajuan> responseKategori =
            await expenseRepository.getKategori();

        final MultiResponse<Perusahaan> responsePerusahaan =
            await expenseRepository.getPerusahaan();

        final MultiResponse<Cabang> responseCabang =
            await expenseRepository.getCabang();

        yield (CreatePengajuanState(
            listKategori: responseKategori.data,
            listCabang: responseCabang.data,
            listPerusahaan: responsePerusahaan.data));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
    if (event is CreateReimburseEvent) {
      try {
        final SingleResponse<String> response =
            await expenseRepository.postReimburse(event.reimburse);
        print(response.message);
        if (response.success) {
          yield SuccesState<String>(data: response.data);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
    if (event is CreateKasbonEvent) {
      try {
        final SingleResponse<String> response =
            await expenseRepository.postKasbon(event.kasbon);
        print(response.message);
        if (response.success) {
          yield SuccesState<String>(data: response.data);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
