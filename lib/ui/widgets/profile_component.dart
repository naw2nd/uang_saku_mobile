import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/profile_property.dart';

class ProfileComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ProfileProperty(
            iconData: Icons.contacts, label: "Nama", value: "Casey Affleck"),
        ProfileProperty(
            iconData: Icons.markunread,
            label: "Email",
            value: "mail@affleck.com"),
        ProfileProperty(
            iconData: Icons.event,
            label: "Tempat, tanggal lahir",
            value: "Surabaya, 25 Februari 1998"),
        ProfileProperty(
            iconData: Icons.place,
            label: "Alamat",
            value: "Rogue Town, East Blue"),
        ProfileProperty(
            iconData: Icons.local_phone,
            label: "No telepon",
            value: "08209570353"),
      ],
    ));
  }
}
