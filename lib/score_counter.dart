// lib/tictactoe/score_counter.dart

class ScoreCounter {
  int playerXWins = 0;
  int playerOWins = 0;

  void incrementPlayerXWins() {
    playerXWins++;
  }

  void incrementPlayerOWins() {
    playerOWins++;
  }

  void reset() {
    playerXWins = 0;
    playerOWins = 0;
  }
}
