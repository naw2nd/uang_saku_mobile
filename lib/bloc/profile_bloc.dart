import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class ProfileBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ProfileBloc({this.expenseRepository}) : super(LoadingState());

  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
  ) async* {
    if (event is ProfileEvent) {
      try {
        final SingleResponse<User> singleResponse =
            await expenseRepository.getProfile();
        if (singleResponse.success) {
          if (event is EditProfileEvent)
            yield EditProfileState(user: singleResponse.data);
          else if (event is ChangePasswordEvent)
            yield ChangePasswordState(user: singleResponse.data);
          else
            yield InitProfileState(user: singleResponse.data);
        } else {
          yield ErrorState(message: singleResponse.message);
        }
      } catch (e) {
        print(e);
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else {
      yield ErrorState(message: "Tidak ada event yang sesuai");
    }
    // if (event is EditProfileEvent) {
    //   try {
    //     final SingleResponse<User> singleResponse =
    //         await expenseRepository.getProfile();
    //     if (singleResponse.success) {
    //       yield EditProfileState(user: singleResponse.data);
    //     } else {
    //       yield ErrorState(message: singleResponse.message);
    //     }
    //   } catch (e) {
    //     print(e);
    //     yield ErrorState(message: "Tidak Terhubung");
    //   }
    // } else if (event is ChangePasswordEvent) yield ChangePasswordState();
  }
}
