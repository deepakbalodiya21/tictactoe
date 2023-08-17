// lib/main.dart

import 'package:flutter/material.dart';
import 'package:tictactoe/score_counter.dart';
import 'package:tictactoe/tictactoe.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TicTacToeScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ));
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  GameLogic gameLogic = GameLogic();
  ScoreCounter scoreCounter = ScoreCounter();

  void _onTileTap(int row, int col) {
    setState(() {
      gameLogic.makeMove(row, col);
      if (gameLogic.checkWin()) {
        if (gameLogic.currentPlayer == 'X') {
          scoreCounter.incrementPlayerOWins();
        } else {
          scoreCounter.incrementPlayerXWins();
        }
        gameLogic.resetBoard();
      } else if (gameLogic.checkDraw()) {
        gameLogic.resetBoard();
      }
    });
  }

  void _resetGame() {
    setState(() {
      gameLogic.resetBoard();
      scoreCounter.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Player X Wins: ${scoreCounter.playerXWins}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Player O Wins: ${scoreCounter.playerOWins}',
              style: TextStyle(fontSize: 20),
            ),
            Board(board: gameLogic.board, onTileTap: _onTileTap),
            ElevatedButton(
              onPressed: _resetGame,
              child: Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }
}
