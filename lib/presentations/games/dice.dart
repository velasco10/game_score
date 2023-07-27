import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_score/utils/constants.dart';
// import 'package:just_audio/just_audio.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  Random random = Random();
  int currentImageIndex = 0;
  int currentIconIndex = 0;
  int counter = 1;
  List<IconData> iconNumber = [
    Icons.looks_one,
    Icons.looks_two,
    Icons.looks_3,
    Icons.looks_4,
    Icons.looks_5,
    Icons.looks_6,
  ];
  // List<String> images = [
  //   'assets/images/dice_1.png',
  //   'assets/images/dice_2.png',
  //   'assets/images/dice_3.png',
  //   'assets/images/dice_4.png',
  //   'assets/images/dice_5.png',
  //   'assets/images/dice_6.png',
  // ];
  // AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.diceGame),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: random.nextDouble() * 180,
            child: Icon(
              iconNumber[currentIconIndex],
              size: 200,
              color: Colors.teal,
            ),
            // Image.asset(
            // images[currentImageIndex],
            //   height: 100,
            // ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () async {
              // Rolling the dice

              // Sound
              // await player.setAsset('assets/audios/rolling-dice.mp3');
              // player.play();

              // Roll the dice
              Timer.periodic(const Duration(milliseconds: 80), (timer) {
                counter++;
                setState(() {
                  // currentImageIndex = random.nextInt(6);
                  currentIconIndex = random.nextInt(6);
                });

                if (counter >= 13) {
                  timer.cancel();

                  setState(() {
                    counter = 1;
                  });
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Constants.roll,
                style: const TextStyle(fontSize: 26),
              ),
            ),
          )
        ],
      )),
    );
  }
}
