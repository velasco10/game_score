import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game_score/utils/constants.dart';

class Coin extends StatefulWidget {
  const Coin({super.key});

  @override
  _CoinState createState() => _CoinState();
}

class _CoinState extends State<Coin> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _angleX = 0;
  double _angleZ = 0;
  double _translationY = 0;
  bool _isHeads = true;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAnimating = false;
          _isHeads = Random().nextBool();
          _angleX = 0;
          _angleZ = 0;
          _translationY = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCoin() {
    if (!_isAnimating) {
      setState(() {
        _isAnimating = true;
        _angleX = 2 * pi;
        _angleZ = Random().nextDouble() * pi - (pi / 2); // Random value between -pi/2 and pi/2
        _translationY = -100; // Elevación mientras gira (ajusta este valor según tus preferencias)
      });
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.coinGame),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double rotationAngleX = _angleX * _animation.value;
            double rotationAngleZ = _angleZ * _animation.value;
            double translateY = _translationY * (1 - _animation.value); // Elevación mientras gira

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(rotationAngleX)
                ..rotateZ(rotationAngleZ)
                ..translate(0, translateY, 0),
              child: GestureDetector(
                onTap: _flipCoin,
                child: Icon(
                  _isHeads ? Icons.face : Icons.cancel,
                  size: 150,
                  color: Colors.blueGrey,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _flipCoin,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
