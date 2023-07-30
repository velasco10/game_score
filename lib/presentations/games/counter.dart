import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:game_score/utils/constants.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  // void _incrementCounter(int? number) {
  //   setState(() {
  //     number.isDefinedAndNotNull ? _counter + number! : _counter++;  
  //   });
  // }

  
  void _incrementCounter() {
    setState(() {
      _counter++;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(Constants.counterGame),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Constants.numPointsCounter,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          // FloatingActionButton(
          //   onPressed: _incrementCounter(10),
          //   tooltip: 'Increment 10',
          //   child: const Icon(Icons.forward_10),
          // ),
          // FloatingActionButton(
          //   onPressed: _incrementCounter(-10),
          //   tooltip: 'Decrement 10',
          //   child: const Icon(Icons.replay_10),
          // )
        ],
      ),
    );
  }
}
