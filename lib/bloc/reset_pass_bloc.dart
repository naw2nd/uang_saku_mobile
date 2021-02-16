import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/reset_pass_event.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ResetPassBloc extends Bloc<ResetPassEvent,BaseState> {
  ExpenseRepository expenseRepository;

  ResetPassBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(ResetPassEvent event) async*{
    yield LoadingState();
    try{
      final SingleResponse<String> response = await expenseRepository.resetPassword(event.email,event.otp,event.password);
      if(response.success){
        yield SuccesState<String>(data: response.message);
      }else{
        yield ErrorState(message: response.message);
      }
    }catch(e){
      yield ErrorState(message: "No Connection");
    }
  }
}