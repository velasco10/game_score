import 'package:flutter/material.dart';

class Tennis extends StatefulWidget {
  const Tennis({Key? key}) : super(key: key);

  @override
  _TennisState createState() => _TennisState();
}

class _TennisState extends State<Tennis> {
  String player1Name = '';
  String player2Name = '';
  int player1Points = 0;
  int player2Points = 0;
  int player1Games = 0;
  int player2Games = 0;
  int player1Sets = 0;
  int player2Sets = 0;
  bool deuce = false;
  bool advantagePlayer1 = false;
  bool advantagePlayer2 = false;

  String _getScoreString(int points) {
    if (points == 0) {
      return '0';
    } else if (points == 1) {
      return '15';
    } else if (points == 2) {
      return '30';
    } else if (points == 3) {
      return '40';
    } else {
      return 'AV';
    }
  }

  void _incrementPlayerPoints(int playerNumber) {
    if (deuce) {
      if (playerNumber == 1) {
        if (!advantagePlayer1) {
          if (advantagePlayer2) {
            advantagePlayer2 = false; // Pierde la ventaja
          } else {
            advantagePlayer1 = true; // Ventaja para jugador 1
          }
        } else {
          _addGameToPlayer(playerNumber); // Gana el juego
        }
      } else if (playerNumber == 2) {
        if (!advantagePlayer2) {
          if (advantagePlayer1) {
            advantagePlayer1 = false; // Pierde la ventaja
          } else {
            advantagePlayer2 = true; // Ventaja para jugador 2
          }
        } else {
          _addGameToPlayer(playerNumber); // Gana el juego
        }
      }
    } else {
      if (playerNumber == 1) {
        setState(() {
          player1Points++;
        });
      } else if (playerNumber == 2) {
        setState(() {
          player2Points++;
        });
      }

      if (_isDeuce()) {
        deuce = true;
        advantagePlayer1 = false;
        advantagePlayer2 = false;
      } else if (_hasWinner()) {
        _addGameToPlayer(playerNumber);
      }
    }
  }

  bool _isDeuce() {
    return player1Points >= 3 && player2Points == player1Points;
  }

  bool _hasWinner() {
    return player1Points >= 4 && player1Points >= player2Points + 2 ||
        player2Points >= 4 && player2Points >= player1Points + 2;
  }

  void _addGameToPlayer(int playerNumber) {
    if (playerNumber == 1) {
      player1Games++;

      if (player1Games >= 6 && player1Games >= player2Games + 2) {
        _addSetToPlayer(playerNumber);
      }
    } else if (playerNumber == 2) {
      player2Games++;

      if (player2Games >= 6 && player2Games >= player1Games + 2) {
        _addSetToPlayer(playerNumber);
      }
    }

    player1Points = 0;
    player2Points = 0;
    deuce = false;
    advantagePlayer1 = false;
    advantagePlayer2 = false;
  }

  void _addSetToPlayer(int playerNumber) {
    if (playerNumber == 1) {
      player1Sets++;
    } else if (playerNumber == 2) {
      player2Sets++;
    }

    player1Games = 0;
    player2Games = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puntuación Tenis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Jugador 1:'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _incrementPlayerPoints(1),
                  child: const Text('Sumar Punto'),
                ),
                const SizedBox(width: 10),
                Text('$player1Name: ${_getScoreString(player1Points)}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Jugador 2:'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _incrementPlayerPoints(2),
                  child: const Text('Sumar Punto'),
                ),
                const SizedBox(width: 10),
                Text('$player2Name: ${_getScoreString(player2Points)}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre Jugador 1'),
              onChanged: (value) {
                setState(() {
                  player1Name = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre Jugador 2'),
              onChanged: (value) {
                setState(() {
                  player2Name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Juegos:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Jugador 1: $player1Games',
                style: const TextStyle(fontSize: 18)),
            Text('Jugador 2: $player2Games',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text('Sets:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Jugador 1: $player1Sets',
                style: const TextStyle(fontSize: 18)),
            Text('Jugador 2: $player2Sets',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
