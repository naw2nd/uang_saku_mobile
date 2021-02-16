import 'package:uang_saku/bloc/bloc.dart';

class VerifyOTPEvent extends BaseEvent {
  final String email;
  final String otp;

  VerifyOTPEvent({this.email, this.otp});

  @override
  List<Object> get props => [email, otp];
}
