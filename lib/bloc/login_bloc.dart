import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/base_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';

class LoginBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  LoginBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is LoginEvent) {
      yield LoadingState();

      try {
        final SingleResponse<Token> response =
            await expenseRepository.login(event.email, event.password);

        if (response.success) {
          expenseRepository.setToken(response.data.token);

          await FirebaseMessaging().getToken().then((value) async {
            final SingleResponse<String> fcmTokenResponse =
                await expenseRepository.postFcmToken(value);
            print(fcmTokenResponse.message);
            print(value);
          });
          yield SuccesState<Token>(data: response.data);
          // expenseRepository.getToken();
        } else {
          // print(response.message);
          yield ErrorState(message: response.message);
        }
      } catch (e) {
        print(e);
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else if (event is LogoutEvent) {
      try {
        await expenseRepository.logout();
        yield EmptyState();
      } catch (e) {
        print(e);
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else {
      yield ErrorState(message: "Tidak ada event yang sesuai");
    }
  }
}
