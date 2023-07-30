import 'package:flutter/material.dart';
import 'package:game_score/presentations/games/coin.dart';
import 'package:game_score/presentations/games/dice.dart';
import 'package:game_score/presentations/games/tennis.dart';
import 'package:game_score/presentations/menu/setup_page.dart';
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
        theme: AppTheme(selectedColor: 1).theme(),
        initialRoute: Constants.initialRoute,
        routes: <String, WidgetBuilder>{
          Constants.initialRoute: (BuildContext context) => const Menu(),
          Constants.chinchonRoute: (BuildContext context) => const SetupPage(),
          Constants.coinRoute: (BuildContext context) => const Coin(),
          Constants.counterRoute: (BuildContext context) => const Counter(),
          Constants.diceRoute: (BuildContext context) => const Dice(),
          Constants.tennisRoute: (BuildContext context) => const Tennis(),
        });
  }
}
