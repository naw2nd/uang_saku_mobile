import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/event/reimburse_event.dart';
import 'package:uang_saku/bloc/state/list_reimburse_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ListReimburseBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ListReimburseBloc({this.expenseRepository}) : super(LoadingState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is InitEvent) {
      try {
        final MultiResponse<Reimburse> multiResponse =
            await expenseRepository.getListReimburse();
        if (multiResponse.success) {
          yield ListReimburseState(reimburse: multiResponse.data);
        } else {
          yield ErrorState(message: multiResponse.message);
        }
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else if (event is GetReimburseEvent) {
      try {
        final SingleResponse<Reimburse> singleResponse =
            await expenseRepository.getReimburse(event.id);
        if (singleResponse.success) {
          yield ReimburseState(reimburse: singleResponse.data);
        } else {
          yield ErrorState(message: singleResponse.message);
        }
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else if (event is PostApprovalReimburseEvent) {
      try {
        yield SuccesState<String>(data: "Success update pengajuan");
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else {
      yield ErrorState(message: "Tidak ada event yang sesuai");
    }
  }
}
