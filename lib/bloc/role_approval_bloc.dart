import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/state/approval_state.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/model/role_approval.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class RoleApprovalBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  RoleApprovalBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is InitEvent) {
      yield (LoadingState());
      //mengambil role approval yg dimiliki user untuk ditampilkan di dashboard
      try {
        final MultiResponse<RoleApproval> responseRoleApproval =
            await expenseRepository.getRoleApproval();
        yield RoleApprovalState(roleApproval: responseRoleApproval.data);
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    }
  }
}
