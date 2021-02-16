import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/forgot_password_event.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ForgotPasswordBloc extends Bloc<ForgotpasswordEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ForgotPasswordBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(ForgotpasswordEvent event) async* {
   yield LoadingState();
   try{
     final SingleResponse<String> response = await expenseRepository.forgetPassword(event.email);
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
