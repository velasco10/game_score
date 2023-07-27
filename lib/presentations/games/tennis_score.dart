// import 'package:flutter/material.dart';

// class TennisScore extends StatelessWidget {
//   final List<int> player1Scores;
//   final List<int> player2Scores;

//   const TennisScore({super.key, required this.player1Scores, required this.player2Scores});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Puntuación de Tenis'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Table(
//           border: TableBorder.all(),
//           defaultColumnWidth: const IntrinsicColumnWidth(),
//           children: [
//             const TableRow(
//               children: [
//                 TableCell(
//                   child: Center(child: Text('Jugador 1')),
//                 ),
//                 TableCell(
//                   child: Center(child: Text('Jugador 2')),
//                 ),
//               ],
//             ),
//             ...List.generate(
//               player1Scores.length,
//               (index) => TableRow(
//                 children: [
//                   TableCell(
//                     child: Center(child: Text(player1Scores[index].toString())),
//                   ),
//                   TableCell(
//                     child: Center(child: Text(player2Scores[index].toString())),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
