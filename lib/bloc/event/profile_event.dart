import 'package:uang_saku/bloc/event/base_event.dart';
import 'package:uang_saku/model/user.dart';

class ProfileEvent extends BaseEvent {
  @override
  List<Object> get props => [];
}

class EditProfileEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ChangePasswordEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends BaseEvent {
  final User user;
  UpdateProfileEvent({this.user});
  @override
  List<Object> get props => [user];
}
class UpdatePasswordEvent extends ProfileEvent {
  final String password;
  UpdatePasswordEvent({this.password});
  @override
  List<Object> get props => [password];
}
