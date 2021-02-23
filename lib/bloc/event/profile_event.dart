part of '../profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileDescriptionEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {}

class ChangePasswordEvent extends ProfileEvent {}
