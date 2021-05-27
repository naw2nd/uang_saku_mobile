import 'package:uang_saku/bloc/bloc.dart';

class ForgotPasswordEvent extends BaseEvent {
  @override
  List<Object> get props => [];
}

class SendEmailEvent extends ForgotPasswordEvent {
  final String email;
  SendEmailEvent({this.email});
  @override
  List<Object> get props => [email];
}

class VerifyOTPEvent extends ForgotPasswordEvent {
  final String email;
  final String otp;

  VerifyOTPEvent({this.email,this.otp});
  @override
  List<Object> get props => [email,otp];
}
class ResetPasswordEvent extends ForgotPasswordEvent {
  final String email;
  final String otp;
  final String password;

  ResetPasswordEvent({this.email,this.otp,this.password});
  @override
  List<Object> get props => [email,otp,password];
}

class CloseEvent extends ForgotPasswordEvent{
  @override
  List<Object> get props => [];
}