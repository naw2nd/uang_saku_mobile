import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/forgot_password_bloc.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/verifiy_otp_bloc.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:uang_saku/repository/remote/http_service.dart';
import 'package:uang_saku/ui/splash_screen.dart';
import 'package:uang_saku/bloc/reset_pass_bloc.dart';
import 'package:uang_saku/bloc/kasbon_bloc.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ExpenseRepository expenseRepository =
      ExpenseRepository(remoteDataSource: HttpService());
  // final ExpenseRepository expenseRepository = ExpenseRepository(
  //     remoteDataSource: RemoteDataSource(httpClient: http.Client()));

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
                  ResetPassBloc(expenseRepository: expenseRepository)),
          BlocProvider<ProfileBloc>(
            create: (context) =>
                ProfileBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<KasbonBloc>(
              create: (context) =>
                  KasbonBloc(expenseRepository: expenseRepository)),
           BlocProvider<ListKasbonBloc>(
              create: (context) =>
                  ListKasbonBloc(expenseRepository: expenseRepository))
        ],
        child: MaterialApp(
          home: SplashScreen(),
        ));
  }
}
