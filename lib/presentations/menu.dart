import 'package:flutter/material.dart';
import 'package:game_score/presentations/menu/menu_list.dart';
import '../utils/constants.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: const Center(child: MenuList())
    );
  }
}