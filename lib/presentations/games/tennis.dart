import 'package:flutter/material.dart';
import 'package:game_score/utils/constants.dart';

class Tennis extends StatefulWidget {
  const Tennis({Key? key}) : super(key: key);

  @override
  State<Tennis> createState() => _TennisState();
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

  List<SetEntry> setEntries = [];

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
            setState(() {
              player2Points--;
            });
          } else {
            advantagePlayer1 = true; // Ventaja para jugador 1
            setState(() {
              player1Points++;
            });
          }
        } else {
          _addGameToPlayer(playerNumber); // Gana el juego
        }
      } else if (playerNumber == 2) {
        if (!advantagePlayer2) {
          if (advantagePlayer1) {
            advantagePlayer1 = false; // Pierde la ventaja
            setState(() {
              player1Points--;
            });
          } else {
            advantagePlayer2 = true;
            setState(() {
              player2Points++;
            }); // Ventaja para jugador 2
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
      setEntries.add(SetEntry(
        player1Games: player1Games,
        player2Games: player2Games,
      ));
      if (player1Sets >= 2) {
        // Jugador 1 ha ganado la partida
        _showWinnerDialog(player1Name);
      }
    } else if (playerNumber == 2) {
      player2Sets++;
      setEntries.add(SetEntry(
        player1Games: player1Games,
        player2Games: player2Games,
      ));
      if (player2Sets >= 2) {
        // Jugador 2 ha ganado la partida
        _showWinnerDialog(player2Name);
      }
    }

    player1Games = 0;
    player2Games = 0;
  }

  void _showWinnerDialog(String playerName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¡Partida finalizada!'),
          content: Text('$playerName ha ganado la partida.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.tennisPuntuation),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(Constants.tennisPlayer1),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _incrementPlayerPoints(1),
                  child: Text(Constants.addPoint),
                ),
                const SizedBox(width: 10),
                Text('$player1Name: ${_getScoreString(player1Points)}',
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 20),
            Text(Constants.tennisPlayer2),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _incrementPlayerPoints(2),
                  child: Text(Constants.addPoint),
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
            Text('Puntuaciones de Sets',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DataTable(
              columns: [
                DataColumn(label: Text('Jugador 1')),
                DataColumn(label: Text('Jugador 2')),
                DataColumn(label: Text('Resultado')),
              ],
              rows: setEntries.map((entry) {
                return DataRow(cells: [
                  DataCell(Text('${entry.player1Games}')),
                  DataCell(Text('${entry.player2Games}')),
                  DataCell(Text('${entry.player1Games}-${entry.player2Games}')),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SetEntry {
  int player1Games;
  int player2Games;

  SetEntry({
    required this.player1Games,
    required this.player2Games,
  });
}
