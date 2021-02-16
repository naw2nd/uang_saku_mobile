import 'package:uang_saku/bloc/bloc.dart';

class ResetPassEvent extends BaseEvent {
  String email;
  String otp;
  String password;

  ResetPassEvent({this.email,this.otp,this.password});

  @override
  List<Object> get props => [email,otp,password];
}