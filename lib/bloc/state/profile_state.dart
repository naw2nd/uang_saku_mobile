import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';

class ProfileState extends BaseState {
  final User user;

  ProfileState({this.user});

  @override
  List<Object> get props => [user];
}
class InitProfileState extends ProfileState{
  final User user;

  InitProfileState({this.user}) : super(user: user);

  @override
  List<Object> get props => [user];
}
class EditProfileState extends ProfileState {
  final User user;

  EditProfileState({this.user}) : super(user: user);

  @override
  List<Object> get props => [user];
}

class ChangePasswordState extends ProfileState {
  final User user;

  ChangePasswordState({this.user}) : super(user: user);

  @override
  List<Object> get props => [user];
}
