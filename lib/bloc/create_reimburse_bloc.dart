import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/create_reimburse_event.dart';
import 'package:uang_saku/model/single_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class CreateReimburseBloc extends Bloc<CreateReimburseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  CreateReimburseBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(CreateReimburseEvent event) async* {
    if(event is CreateReimburseEvent){
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
