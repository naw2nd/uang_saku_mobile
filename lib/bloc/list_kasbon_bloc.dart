import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/list_kasbon_state.dart';
import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'event/base_event.dart';

class ListKasbonBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ListKasbonBloc({this.expenseRepository}) : super(LoadingState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is InitEvent) {
      try {
        final MultiResponse<Kasbon> multiResponse =
            await expenseRepository.getListKasbon();
        if (multiResponse.success) {
          yield ListKasbonState(kasbon: multiResponse.data);
        } else {
          yield ErrorState(message: multiResponse.message);
        }
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else if (event is GetKasbonEvent) {
      try {
        final SingleResponse<Kasbon> singleResponse =
            await expenseRepository.getKasbon(event.id);
        if (singleResponse.success) {
          yield KasbonState(kasbon: singleResponse.data);
        } else {
          yield ErrorState(message: singleResponse.message);
        }
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else {
      yield ErrorState(message: "Tidak ada event yang sesuai");
    }
  }
}
