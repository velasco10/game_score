import 'package:flutter/material.dart';
import 'package:game_score/presentations/games/chinchon.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int _numberOfPlayers = 2;
  List<String> _playerNames = [];

  @override
  void initState() {
    super.initState();
    // Inicializar la lista de nombres con valores vacíos para todos los jugadores.
    _playerNames = List.generate(_numberOfPlayers, (index) => '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Jugadores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Número de jugadores:'),
            Slider(
              value: _numberOfPlayers.toDouble(),
              min: 1,
              max: 6,
              divisions: 5,
              onChanged: (value) {
                setState(() {
                  _numberOfPlayers = value.toInt();
                  // Asegurarnos de tener suficientes elementos en la lista de nombres.
                  if (_playerNames.length < _numberOfPlayers) {
                    _playerNames.addAll(List.generate(_numberOfPlayers - _playerNames.length, (index) => ''));
                  } else if (_playerNames.length > _numberOfPlayers) {
                    _playerNames.removeRange(_numberOfPlayers, _playerNames.length);
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Nombres de los jugadores:'),
            for (int i = 0; i < _numberOfPlayers; i++)
              TextFormField(
                decoration: InputDecoration(labelText: 'Jugador ${i + 1}'),
                onChanged: (value) {
                  setState(() {
                    _playerNames[i] = value;
                  });
                },
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la página de juego con los nombres y valores iniciales.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Chinchon(playerNames: _playerNames),
                  ),
                );
              },
              child: const Text('Comenzar Juego'),
            ),
          ],
        ),
      ),
    );
  }
}
