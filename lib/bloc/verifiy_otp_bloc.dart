import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/verify_otp_event.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, BaseState> {
  ExpenseRepository expenseRepository;

  VerifyOTPBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(VerifyOTPEvent event) async* {
    yield LoadingState();
    try {
      final SingleResponse<String> response =
          await expenseRepository.verifyOtp(event.email, event.otp);
      if (response.success) {
        yield SuccesState<String>(data: response.message);
      } else {
        yield ErrorState(message: response.message);
      }
    } catch (e) {
      yield ErrorState(message: "No Connection");
    }
  }
}
