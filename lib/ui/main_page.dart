import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/login_page.dart';
import 'package:uang_saku/ui/bottom_navbar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, BaseState>(
      builder: (_, state) {
        if (state is SuccesState<Token>)
          return BottomNavbar();
        else
          return LoginPage();
      },
    );
  }
}
