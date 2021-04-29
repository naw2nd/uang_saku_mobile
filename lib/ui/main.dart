import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/create_pengajuan_bloc.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/forgot_password_bloc.dart';
import 'package:uang_saku/bloc/reimburse_bloc.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/role_approval_bloc.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:uang_saku/repository/remote/http_service.dart';
import 'package:uang_saku/ui/splash_screen.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  // if (message.containsKey('data')) {
  //   // Handle data message
  //   final dynamic data = message['data'];
  // }

  // if (message.containsKey('notification')) {
  //   // Handle notification message
  //   final dynamic notification = message['notification'];
  // }
  print("background");
  // Or do other work.
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ExpenseRepository expenseRepository =
      ExpenseRepository(remoteDataSource: HttpService());

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // _showItemDialog(message);
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // _navigateToItemDetail(message);
      },
    );
    super.initState();
  }

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
          BlocProvider<KasbonBloc>(
              create: (context) =>
                  KasbonBloc(expenseRepository: expenseRepository)),
          BlocProvider<ReimburseBloc>(
              create: (context) =>
                  ReimburseBloc(expenseRepository: expenseRepository)),
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
        ],
        child: MaterialApp(
          home: SplashScreen(),
        ));
  }
}
