import 'package:flutter/material.dart';
import 'presentations/menu.dart';
import 'utils/constants.dart';

void main() {
  runApp(const GameScore());
}

class GameScore extends StatelessWidget {
  const GameScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: const Menu()
    );
  }
} 
