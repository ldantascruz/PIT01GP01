import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/widgets/homepage/action_app_bar.dart';
import 'package:finances_group/src/view/widgets/homepage/title_app_bar.dart';
import 'package:flutter/material.dart';
import 'custom_bottom_app_bar.dart';

final appBar = AppBar(
  elevation: 0,
  centerTitle: false,
  toolbarHeight: 75,
  title: const TitleAppBar(),
  actions: const [ActionAppBar()],
  automaticallyImplyLeading: false,
);

const bottomAppBAr = CustomBottomAppBar(
  fabLocation: FloatingActionButtonLocation.centerDocked,
  shape: CircularNotchedRectangle(),
);

final floatingActionButton = FloatingActionButton(
  child: Container(
    width: 60,
    height: 60,
    decoration: const BoxDecoration(
        shape: BoxShape.circle, gradient: AppCustomColors.cyanGreen),
    child: const Icon(Icons.add),
  ),
  onPressed: () {
    debugPrint('FAT');
  },
);