import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/state/approval_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ListApprovalKasbonBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ListApprovalKasbonBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is GetApprovalPengajuanEvent) {
      yield (LoadingState());
      try {
        print("init event approval kasbon");
        final MultiResponse<Kasbon> responseApprovalKasbon =
            await expenseRepository.getApprovalKasbon(
                event.idRoleApproval, event.bodyApproval);
        yield (ListApprovalPengajuanState(
            listApprovalPengajuan: responseApprovalKasbon.data));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is PostApprovalKasbonEvent) {
      try {
        print("post event approval kasbon");
        final SingleResponse singleResponse = await expenseRepository
            .postApprovalKasbon(event.idRoleApproval, event.bodyApproval);
        yield (SuccesState<String>(data: singleResponse.message));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
