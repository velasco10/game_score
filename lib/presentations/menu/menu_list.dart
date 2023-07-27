import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/chinchon');
            },
          child: const Row(
            children: [
              Icon(Icons.deck),
              // Text(Constants.chinchonGame),
              Text('Chinchon'),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/tennis');
          },
          child: const Row(
            children: [
              Icon(Icons.sports_tennis),
              // Text(Constants.tennisGame),
              Text('Tenis'),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/counter');
          },
          child: const Row(
            children: [
              Icon(Icons.exposure),
              // Text(Constants.diceGame),
              Text('Contador'),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pushNamed('/dice');
          },
          child: const Row(
            children: [
              Icon(Icons.casino),
              // Text(Constants.diceGame),
              Text('Lanzamiento de Dado'),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.of(context, rootNavigator: true).pushNamed('/coin');
          },
          child: const Row(
            children: [
              Icon(Icons.rule_folder),
              // Text(Constants.coinGame),
              Text('Lanzamiento de Moneda'),
            ],
          ),
        )
      ],
    );
  }
}
