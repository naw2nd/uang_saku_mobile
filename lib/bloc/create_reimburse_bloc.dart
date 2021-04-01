import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/create_reimburse_event.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/kategori_pengajuan.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/single_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class CreateReimburseBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  CreateReimburseBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is GetMenuItemsEvent) {
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
          // yield EmailVerifiedState(email: event.email);
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
