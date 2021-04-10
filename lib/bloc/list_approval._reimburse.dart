import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/state/approval_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ListApprovalReimburseBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ListApprovalReimburseBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is GetApprovalPengajuanEvent) {
      yield (LoadingState());
      try {
        print("init event approval reimburse");
        final MultiResponse<Reimburse> responseApprovalPengajuan =
            await expenseRepository.getApprovalReimburse(
                event.idRoleApproval, event.bodyApproval);
        yield (ListApprovalPengajuanState(
            listApprovalPengajuan: responseApprovalPengajuan.data));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is PostApprovalReimburseEvent) {
      try {
        print("post event approval reimburse");
        final SingleResponse singleResponse = await expenseRepository
            .postApprovalReimburse(event.idRoleApproval, event.bodyApproval);
        yield (SuccesState<String>(data: singleResponse.message));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
