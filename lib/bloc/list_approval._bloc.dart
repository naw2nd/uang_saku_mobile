import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/state/approval_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ListApprovalBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ListApprovalBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is GetApprovalPengajuanEvent) {
      yield (LoadingState());
      try {
        if (event.jenisPengajuan == "Reimburse") {
          print("init event approval reimburse");
          final MultiResponse<Reimburse> responseApprovalPengajuan =
              await expenseRepository.getApprovalReimburse(
                  event.idRoleApproval, event.bodyApproval);
          yield (ListApprovalPengajuanState(
              listApprovalPengajuan: responseApprovalPengajuan.data));
        } else {
          print("init event approval kasbon");
          final MultiResponse<Kasbon> responseApprovalKasbon =
              await expenseRepository.getApprovalKasbon(
                  event.idRoleApproval, event.bodyApproval);
          yield (ListApprovalPengajuanState(
              listApprovalPengajuan: responseApprovalKasbon.data));
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
