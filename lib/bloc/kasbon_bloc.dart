import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class KasbonBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  KasbonBloc({this.expenseRepository}) : super(LoadingState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is KasbonEvent) {
      try {
        print("kasbon bloc");
        final SingleResponse<Kasbon> singleResponse =
            await expenseRepository.getKasbon();
        print("bisa");
        if (singleResponse.success) {
          print(singleResponse.message);
          print(singleResponse.data);
          print(singleResponse.data.rincianPengajuan.toString());
          yield KasbonState(kasbon: singleResponse.data);
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
  }
}
