import 'package:uang_saku/bloc/bloc.dart';

class ForgotpasswordEvent extends BaseEvent {
  final String email;

  ForgotpasswordEvent({this.email});
  @override
  List<Object> get props => [email];
}
