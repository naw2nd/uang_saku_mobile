import 'package:bloc/bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/create_pengajuan_event.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/multi_response.dart';
import 'package:uang_saku/repository/expense_repository.dart';

class CreateRincianBiayaBloc extends Bloc<BaseEvent, BaseState> {
  ExpenseRepository expenseRepository;

  CreateRincianBiayaBloc({this.expenseRepository}) : super(EmptyState());

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    if (event is InitRincianEvent) {
      try {
        print("rgilsj");
        final MultiResponse<KategoriBiaya> responseKategoriBiaya =
            await expenseRepository.getKategoriBiaya();

        yield (CreateRincianBiayaState(
            listKategoriBiaya: responseKategoriBiaya.data));
      } catch (e) {
        yield ErrorState(message: "No Connection");
      }
    } else if (event is AddRincianBiayaEvent) {
      print("add rincian");
      yield (RincianBiayaState(rincianRealisasi: event.rincianRealisasi));
      // yield EmptyState();
    } else{
      yield EmptyState();
    }
  }
}
