import 'package:finances_group/src/models/user_model.dart';

import 'package:flutter/material.dart';

import '../../../../features/home/widgets/action_app_bar.dart';
import '../../../../features/home/widgets/title_app_bar.dart';

class CustomAppBar extends StatelessWidget {
  final String? userName;
  final String? userImage;
  final UserModel? userLogged;

  const CustomAppBar(
      {super.key,
      required this.userName,
      required this.userImage,
      this.userLogged});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 75,
      title: TitleAppBar(userImage: userImage, userName: userName),
      actions: [
        ActionAppBar(
          userLogged: userLogged,
        )
      ],
      automaticallyImplyLeading: false,
    );
  }
}
