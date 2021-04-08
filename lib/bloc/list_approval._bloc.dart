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
        print("init event approval reimburse");
        if (event.jenisPengajuan == "Reimburse") {
          final MultiResponse<Reimburse> responseApprovalPengajuan =
              await expenseRepository.getApprovalReimburse(
                  event.idRoleApproval, event.bodyApproval);
          yield (ListApprovalPengajuanState(
              listApprovalPengajuan: responseApprovalPengajuan.data));
        } else{
          final MultiResponse<Kasbon> responseApprovalReimburse =
              await expenseRepository.getApprovalKasbon(
                  event.idRoleApproval, event.bodyApproval);
          yield (ListApprovalPengajuanState(
              listApprovalPengajuan: responseApprovalReimburse.data));

        }

        // responseApproval = await expenseRepository.getApprovalReimburse(
        //     event.idRoleApproval, event.bodyApproval);

      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
