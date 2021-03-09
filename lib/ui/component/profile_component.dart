import 'package:flutter/material.dart';
import 'package:uang_saku/model/user.dart';
import 'package:uang_saku/ui/custom_widgets/profile_property.dart';
import 'package:intl/intl.dart';

class ProfileComponent extends StatelessWidget {
  final User user;
  ProfileComponent({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ProfileProperty(
            iconData: Icons.contacts, label: "Nama", value: user.nama),
        ProfileProperty(
            iconData: Icons.markunread, label: "Email", value: user.email),
        ProfileProperty(
            iconData: Icons.event,
            label: "Tempat, tanggal lahir",
            value:
                "${user.tempatLahir}. ${DateFormat.yMMMMd('en_US').format(user.tglLahir)}"),
        ProfileProperty(
            iconData: Icons.place, label: "Alamat", value: user.alamat),
        ProfileProperty(
            iconData: Icons.local_phone,
            label: "No telepon",
            value: user.noTelp),
      ],
    ));
  }
}
