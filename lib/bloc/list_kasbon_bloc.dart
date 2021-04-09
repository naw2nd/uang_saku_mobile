import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:uang_saku/bloc/event/list_kasbon_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/kasbon_state.dart';
import 'package:uang_saku/bloc/state/list_kasbon_state.dart';
import 'package:uang_saku/model/kasbon.dart';
//import 'package:uang_saku/model/list_kasbon.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:uang_saku/ui/list_kasbon.dart';
import 'event/base_event.dart';

class ListKasbonBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  ListKasbonBloc({this.expenseRepository}) : super(LoadingState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is ListKasbonEvent) {
      try {
        print("listKasbon bloc");
        final MultiResponse<Kasbon> multiResponse =
            await expenseRepository.getListKasbon();
        print("berhasil");
        if (multiResponse.success) {
          print("test");
          print(multiResponse.message);
          print(multiResponse.data);
          yield ListKasbonState(kasbon: multiResponse.data);
        } else {
          yield ErrorState(message: multiResponse.message);
        }
      } catch (e) {
        yield ErrorState(message: "Tidak Terhubung");
      }
    } else {
      yield ErrorState(message: "Tidak ada event yang sesuai");
    }
  }
}
