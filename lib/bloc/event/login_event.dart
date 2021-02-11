import 'package:uang_saku/bloc/event/base_event.dart';

class LoginEvent extends BaseEvent {
  final String email;
  final String password;

  LoginEvent({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends BaseEvent {
  LogoutEvent();

  @override
  List<Object> get props => [];
}
