import 'package:uang_saku/bloc/bloc.dart';

class ForgotPasswordState extends BaseState {
  @override
  List<Object> get props => [];
}

class EmailVerifiedState extends ForgotPasswordState {
  final String email;

  EmailVerifiedState({this.email});
  @override
  List<Object> get props => [email];
}

class OTPVerifiedState extends ForgotPasswordState {
  final String email;
  final String otp;

  OTPVerifiedState({this.email, this.otp});
  @override
  List<Object> get props => [email, otp];
}
