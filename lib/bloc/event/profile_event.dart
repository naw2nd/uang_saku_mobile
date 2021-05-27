import 'package:uang_saku/bloc/event/base_event.dart';
import 'package:uang_saku/model/user.dart';

class ProfileEvent extends BaseEvent {
  //event untuk ke halaman detail profile
  @override
  List<Object> get props => [];
}

class EditProfileEvent extends ProfileEvent {
  //event untuk ke halaman edit profile
  @override
  List<Object> get props => [];
}

class ChangePasswordEvent extends ProfileEvent {
  //event untuk kehalaman change password
  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends BaseEvent {
  //event untuk edit profile ke API
  final User user;
  UpdateProfileEvent({this.user});
  @override
  List<Object> get props => [user];
}

class UpdatePasswordEvent extends BaseEvent {
  //event untuk update password ke api
  final String password;
  UpdatePasswordEvent({this.password});
  @override
  List<Object> get props => [password];
}


