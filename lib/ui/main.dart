import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/create_pengajuan_bloc.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/forgot_password_bloc.dart';
import 'package:uang_saku/bloc/list_approval._reimburse.dart';
import 'package:uang_saku/bloc/list_approval_kasbon._bloc.dart';
import 'package:uang_saku/bloc/list_reimburse_bloc.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/role_approval_bloc.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:uang_saku/repository/remote/http_service.dart';
import 'package:uang_saku/ui/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ExpenseRepository expenseRepository =
      ExpenseRepository(remoteDataSource: HttpService());

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
          BlocProvider<ProfileBloc>(
            create: (context) =>
                ProfileBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<ListKasbonBloc>(
              create: (context) =>
                  ListKasbonBloc(expenseRepository: expenseRepository)),
          BlocProvider<ListReimburseBloc>(
              create: (context) =>
                  ListReimburseBloc(expenseRepository: expenseRepository)),
          BlocProvider<CreatePengajuanBloc>(
            create: (context) =>
                CreatePengajuanBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<CreateRincianBiayaBloc>(
            create: (context) =>
                CreateRincianBiayaBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<RoleApprovalBloc>(
            create: (context) =>
                RoleApprovalBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<ListApprovalKasbonBloc>(
            create: (context) =>
                ListApprovalKasbonBloc(expenseRepository: expenseRepository),
          ),
          BlocProvider<ListApprovalReimburseBloc>(
            create: (context) =>
                ListApprovalReimburseBloc(expenseRepository: expenseRepository),
          ),
        ],
        child: MaterialApp(
          home: SplashScreen(),
        ));
  }
}
