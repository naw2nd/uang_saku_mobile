import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/forgot_password_bloc.dart';
import 'package:uang_saku/bloc/reset_pass_bloc.dart';
import 'package:uang_saku/bloc/verifiy_otp_bloc.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:uang_saku/repository/remote/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:uang_saku/ui/create_kasbon.dart';
import 'package:uang_saku/ui/list_reimburse.dart';
import 'package:uang_saku/ui/widgets/filter_dialog.dart';
import 'package:uang_saku/ui/list_kasbon.dart';
import 'package:uang_saku/ui/widgets/bottom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ExpenseRepository expenseRepository = ExpenseRepository(
      remoteDataSource: RemoteDataSource(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<ForgotPasswordBloc>(
              create: (context) =>
                  ForgotPasswordBloc(expenseRepository: expenseRepository)),
          BlocProvider<VerifyOTPBloc>(
            create: (context) =>
                VerifyOTPBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<ResetPassBloc>(
              create: (context) =>
                  ResetPassBloc(expenseRepository: expenseRepository))
        ],
        child: MaterialApp(
          home: CreateKasbon(),
        ));
  }
}
