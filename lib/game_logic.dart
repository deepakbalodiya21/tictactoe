// lib/tictactoe/game_logic.dart

import 'score_counter.dart';

class GameLogic {
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  String currentPlayer = 'X';
  ScoreCounter scoreCounter = ScoreCounter();

  void makeMove(int row, int col) {
    if (board[row][col] == '') {
      board[row][col] = currentPlayer;
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    }
  }

  bool checkWin() {
    // Check rows, columns, and diagonals for a win
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[i][0] == board[i][2] &&
          board[i][0] != '') {
        if (board[i][0] == 'X') {
          scoreCounter.incrementPlayerXWins();
        } else {
          scoreCounter.incrementPlayerOWins();
        }
        return true;
      }
      if (board[0][i] == board[1][i] &&
          board[0][i] == board[2][i] &&
          board[0][i] != '') {
        if (board[0][i] == 'X') {
          scoreCounter.incrementPlayerXWins();
        } else {
          scoreCounter.incrementPlayerOWins();
        }
        return true;
      }
    }

    if (board[0][0] == board[1][1] &&
        board[0][0] == board[2][2] &&
        board[0][0] != '') {
      if (board[0][0] == 'X') {
        scoreCounter.incrementPlayerXWins();
      } else {
        scoreCounter.incrementPlayerOWins();
      }
      return true;
    }

    if (board[0][2] == board[1][1] &&
        board[0][2] == board[2][0] &&
        board[0][2] != '') {
      if (board[0][2] == 'X') {
        scoreCounter.incrementPlayerXWins();
      } else {
        scoreCounter.incrementPlayerOWins();
      }
      return true;
    }

    return false;
  }

  bool checkDraw() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return false; // There's an empty cell, game is not a draw
        }
      }
    }
    return true; // All cells are filled, game is a draw
  }

  void resetBoard() {
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
    currentPlayer = 'X';
  }
}
