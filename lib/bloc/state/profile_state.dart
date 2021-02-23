part of '../profile_bloc.dart';

abstract class ProfileState extends Equatable {
  final String currentValue;
  final String nextValue;
  const ProfileState(this.currentValue, this.nextValue);

  @override
  List<Object> get props => [currentValue, nextValue];
}

class ProfileInitial extends ProfileState {
  ProfileInitial(String currentValue, String nextValue)
      : super(currentValue, nextValue);
}

class EditProfileValue extends ProfileState {
  EditProfileValue(String currentValue, String nextValue)
      : super(currentValue, nextValue);
}

class ChangePasswordValue extends ProfileState {
  ChangePasswordValue(String currentValue, String nextValue)
      : super(currentValue, nextValue);
}
