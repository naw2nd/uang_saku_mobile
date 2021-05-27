import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/list_kasbon_state.dart';
import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'event/approval_event.dart';
import 'event/base_event.dart';
import 'event/laporan_event.dart';
import 'state/approval_state.dart';
// untuk file laporan_bloc masih perlu ditinjau ulang, karena beberapa fungsinya masih berasal dari kasbon_bloc
class LaporanBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  LaporanBloc({this.expenseRepository}) : super(LoadingState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is GetFormAttributeKasbon) {
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

        yield (FormAttributeStateKasbon(
            listKategori: responseKategori.data,
            listCabang: responseCabang.data,
            listDepartment: responseDepartment.data,
            listPerusahaan: responsePerusahaan.data));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is GetListKasbonEvent) {
      try {
        final MultiResponse<Kasbon> multiResponse =
            await expenseRepository.getListKasbon();
        if (multiResponse.success) {
          yield ListKasbonState(kasbon: multiResponse.data);
        } else {
          yield ErrorState(message: multiResponse.message);
        }
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else if (event is GetKasbonEvent) {
      try {
        final SingleResponse<Kasbon> singleResponse =
            await expenseRepository.getKasbon(event.id);
        if (singleResponse.success) {
          yield KasbonState(kasbon: singleResponse.data);
        } else {
          yield ErrorState(message: singleResponse.message);
        }
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else if (event is GetApprovalPengajuanEvent) {
      yield LoadingState();
      try {
        final MultiResponse<KategoriPengajuan> responseKategori =
            await expenseRepository.getKategori();
        final MultiResponse<Kasbon> responseApprovalKasbon =
            await expenseRepository.getApprovalKasbon(
                event.idRoleApproval, event.bodyApproval);
        yield (ListApprovalPengajuanState(
            listApprovalPengajuan: responseApprovalKasbon.data,
            listKategoriPengajuan: responseKategori.data));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is PostApprovalKasbonEvent) {
      try {
        final SingleResponse singleResponse = await expenseRepository
            .postApprovalKasbon(event.idRoleApproval, event.bodyApproval);
        yield (SuccesState<String>(data: singleResponse.message));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is CancelKasbonEvent) {
      try {
        final SingleResponse singleResponse =
            await expenseRepository.cancelKasbon(event.id, event.catatan);
        yield (SuccesState<String>(data: singleResponse.message));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is UpdateKasbonEvent) {
      try {
        final SingleResponse response =
            await expenseRepository.putKasbon(event.kasbon, event.id);
        if (response.success) {
          yield SuccesState(data: response.data);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else {
      yield ErrorState(message: "Tidak ada event yang sesuai");
    }
  }
}
