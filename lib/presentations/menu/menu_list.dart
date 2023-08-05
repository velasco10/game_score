import 'package:flutter/material.dart';
import 'package:game_score/utils/constants.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/chinchon');
          },
          child: Row(
            children: [
              const Icon(Icons.deck),
              Text(Constants.chinchonGame, style: const TextStyle(fontSize: 25)),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/tennis');
          },
          child: Row(
            children: [
              const Icon(Icons.sports_tennis),
              Text(Constants.tennisGame, style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/counter');
          },
          child: Row(
            children: [const Icon(Icons.exposure), Text(Constants.counterGame, style: const TextStyle(fontSize: 25))],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/dice');
          },
          child: Row(
            children: [const Icon(Icons.casino), Text(Constants.diceGame, style: const TextStyle(fontSize: 25))],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/coin');
          },
          child: Row(
            children: [const Icon(Icons.rule_folder), Text(Constants.coinGame, style: const TextStyle(fontSize: 25))],
          ),
        )
      ],
    );
  }
}
