import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ElevatedButton(
          onPressed: () {
            
          }, 
          child: Row(
            children: [
              const Icon(Icons.deck),
              Text(Constants.chinchonGame),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            
          }, 
          child: Row(
            children: [
              const Icon(Icons.sports_tennis),
              Text(Constants.tennisGame),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            
          }, 
          child: Row(
            children: [
              const Icon(Icons.casino),
              Text(Constants.counterGame),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            
          }, 
          child: Row(
            children: [
              const Icon(Icons.casino),
              Text(Constants.diceGame),
            ],
          ),
        ),ElevatedButton(
          onPressed: () {
            
          }, 
          child: Row(
            children: [
              const Icon(Icons.casino),
              Text(Constants.coinGame),
            ],
          ),
        )
      ],
    );
  }
}