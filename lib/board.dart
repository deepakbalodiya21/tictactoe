// lib/tictactoe/board.dart
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  final List<List<String>> board;
  final Function(int, int) onTileTap;

  Board({required this.board, required this.onTileTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        int row = index ~/ 3;
        int col = index % 3;
        return GestureDetector(
          onTap: () {
            if (board[row][col] == '') {
              onTileTap(row, col);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.cyanAccent,
            ),
            child: Center(
              child: Text(
                board[row][col],
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        );
      },
      itemCount: 9,
    );
  }
}
