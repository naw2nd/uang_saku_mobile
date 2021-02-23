import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event/profile_event.dart';
part 'state/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial("","Edit Profil"));

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is EditProfileEvent)
      yield EditProfileValue("Edit Profile","Change Password");
    else if (event is ChangePasswordEvent)
      yield ChangePasswordValue("Change Password","");
    else
      yield ProfileInitial("","Edit Profile");
  }
}
