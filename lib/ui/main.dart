
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:uang_saku/repository/remote/remote_data_source.dart';
import 'package:uang_saku/ui/splash_screen.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ExpenseRepository expenseRepository =
      ExpenseRepository(remoteDataSource: RemoteDataSource(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(expenseRepository: expenseRepository),
          )
        ],
        child: MaterialApp(
          home: SplashScreen(),
        ));
  }
}
