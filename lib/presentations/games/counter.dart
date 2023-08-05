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
  
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter10() {
    setState(() {
      _counter = _counter + 10;
    });
  }
  
  void _decrementCounter10() {
    setState(() {
      _counter = _counter - 10;
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: _incrementCounter10,
            tooltip: 'Increment 10',
            child: const Icon(Icons.forward_10),
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
            onPressed: _decrementCounter10,
            tooltip: 'Decrement 10',
            child: const Icon(Icons.replay_10),
          )
        ],
      ),
    );
  }
}
