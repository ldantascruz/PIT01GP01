import 'dart:math';

import 'package:finances_group/src/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/view/widgets/charts/custom_linear_chart.dart';
import 'package:finances_group/src/view/widgets/homepage/app_bar.dart';
import 'package:finances_group/src/view/widgets/homepage/balance.dart';
import 'package:finances_group/src/view/widgets/homepage/body_transactions.dart';
import 'package:finances_group/src/view/widgets/homepage/my_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _setStatusbarColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var random = Random();
    var weekData =
        List<double>.generate(100, (index) => random.nextDouble() * 100.0);
    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: [
          //const BalanceSection(),
          const SizedBox(height: 100),
          CustomLinearChart(weekData: weekData),
          const SizedBox(height: 100),
          const MyCards(),
          const SizedBox(height: 20),
          const Bodytest(),
        ],
      ),
      bottomNavigationBar: bottomAppBAr,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

_setStatusbarColor() {
  FlutterStatusbarcolor.setStatusBarColor(AppCustomColors.dark);
}
