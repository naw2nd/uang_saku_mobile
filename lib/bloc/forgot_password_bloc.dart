import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/forgot_password_event.dart';
import 'package:uang_saku/bloc/state/forgot_password_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ForgotPasswordBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(ForgotPasswordEvent event) async* {
    yield LoadingState();
    if (event is SendEmailEvent) {
      try {
        final SingleResponse<String> response =
            await expenseRepository.forgetPassword(event.email);
        if (response.success) {
          yield EmailVerifiedState(email: event.email);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is VerifyOTPEvent) {
      try {
        final SingleResponse<String> response =
            await expenseRepository.verifyOtp(event.email, event.otp);
        if (response.success) {
          yield OTPVerifiedState(email: event.email, otp: event.otp);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is ResetPasswordEvent) {
      try {
        final SingleResponse<String> response =
            await expenseRepository.resetPassword(event.email, event.otp, event.password);
        if (response.success) {
          yield SuccesState<String>(data: response.message);
        } else {
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else {yield EmptyState();}
  }
}
