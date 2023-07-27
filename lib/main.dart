import 'package:flutter/material.dart';
import 'package:game_score/presentations/games/chinchon.dart';
import 'package:game_score/presentations/games/coin.dart';
import 'package:game_score/presentations/games/dice.dart';
import 'package:game_score/presentations/games/tennis.dart';
import 'config/theme/app_theme.dart';
import 'presentations/games/counter.dart';
import 'presentations/menu.dart';
import 'utils/constants.dart';

void main() {
  runApp(const GameScore());
}

class GameScore extends StatelessWidget {
  const GameScore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 1).theme(),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const Menu(),
          '/chinchon': (BuildContext context) =>const Chinchon(),
          '/coin': (BuildContext context) =>const Coin(),
          '/counter': (BuildContext context) =>const Counter(),
          '/dice': (BuildContext context) =>const Dice(),
          // '/tennis': (BuildContext context) =>const Tennis(),
        }
      );

  }
} 
