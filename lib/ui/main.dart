import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/create_pengajuan_bloc.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/forgot_password_bloc.dart';
import 'package:uang_saku/bloc/laporan_bloc.dart';
import 'package:uang_saku/bloc/reimburse_bloc.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/role_approval_bloc.dart';
import 'package:uang_saku/model/notifikasi.dart';
import 'package:uang_saku/repository/db_helper.dart';
import 'package:uang_saku/repository/expense_repository.dart';
import 'package:uang_saku/repository/remote/http_service.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/splash_screen.dart';
import 'package:intl/intl.dart';

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
  DbHelper dbHelper = DbHelper();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        Notifikasi notifikasi = Notifikasi(
            day: DateFormat.yMMMd().format(DateTime.now()),
            time: DateFormat("HH:mm").format(DateTime.now()),
            title: message['notification']['title'],
            message: message['notification']['body']);
        popUpNotification(notifikasi);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        Notifikasi notifikasi = Notifikasi(
            day: DateFormat.yMMMd().format(DateTime.now()),
            time: DateFormat("HH:mm").format(DateTime.now()),
            title: message['data']['title'],
            message: message['data']['body']);
        popUpNotification(notifikasi);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        Notifikasi notifikasi = Notifikasi(
            day: DateFormat.yMMMd().format(DateTime.now()),
            time: DateFormat("HH:mm").format(DateTime.now()),
            title: message['data']['title'],
            message: message['data']['body']);
        popUpNotification(notifikasi);
      },
    );
    super.initState();
  }

  popUpNotification(Notifikasi notifikasi) async {
    await dbHelper.insert(notifikasi);
    showOverlayNotification((context) {
      return SafeArea(
        child: DefaultTextStyle(
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Color(0xff555555)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CustomCard(
                container: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Icon(
                          Icons.message_rounded,
                          color: Color(0xFF2B4D66),
                        )),
                    Flexible(
                      flex: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        notifikasi.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14),
                                      )),
                                  Text(
                                    notifikasi.message,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              )),
                          Flexible(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      notifikasi.day,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6f96b0)),
                                    ),
                                  ),
                                  Text(
                                    notifikasi.time,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF58b84b)),
                                  )
                                ],
                              )),
                        ],
                      ),
                    )
                  ]),
            )),
          ),
        ),
      );
    });
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
          BlocProvider<LaporanBloc>(
              create: (context) =>
                  LaporanBloc(expenseRepository: expenseRepository)),
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
        child: OverlaySupport.global(
          child: MaterialApp(
            home: SplashScreen(),
          ),
        ));
  }
}
