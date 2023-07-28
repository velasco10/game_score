import 'package:flutter/material.dart';

class Chinchon extends StatefulWidget {
  final List<String> playerNames;

  const Chinchon({super.key, required this.playerNames});

  @override
  _ChinchonState createState() => _ChinchonState();
}

class _ChinchonState extends State<Chinchon> {
  late List<int> _globalScores;
  List<TextEditingController> _scoreInputControllers = [];

  @override
  void initState() {
    super.initState();
    _globalScores = List.filled(widget.playerNames.length, 0);
    _scoreInputControllers = List.generate(widget.playerNames.length, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _scoreInputControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _confirmScores() {
    for (int i = 0; i < widget.playerNames.length; i++) {
      int score = int.tryParse(_scoreInputControllers[i].text) ?? 0;
      setState(() {
        _globalScores[i] += score;
        _scoreInputControllers[i].clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puntuación Chinchón'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < widget.playerNames.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.playerNames[i],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _scoreInputControllers[i],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Puntuación'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _globalScores[i].toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _confirmScores,
              child: const Text('Confirmar y sumar puntuaciones'),
            ),
          ],
        ),
      ),
    );
  }
}
