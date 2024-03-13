import 'package:flutter/cupertino.dart';

class TicTacToeProvider extends ChangeNotifier{
  List<List<String>> grid = List.generate(3, (_) => List.filled(3, ' '));
  String currentPlayer = 'X';
  List<int>? winningLine;

  void handleMove(int x, int y){
    if (grid[y][x] == ' '){
      grid[y][x] = currentPlayer;
      currentPlayer = (currentPlayer == 'X'? 'O' : 'X');
      notifyListeners();
    }
  }

  bool checkWinCondition(){
    for (int i = 0; i < 3; i++){
      if (grid[i][0] == grid[i][1] && grid[i][1] == grid[i][2] && grid[i][0] != ' '){
        winningLine = [i, 0, i, 2];
        return true;
      }
      if (grid[0][i] == grid[1][i] && grid[1][i] == grid[2][i] && grid[0][i] != ' '){
        winningLine = [0, i, 2, i];
        return true;
      }
    }
    if (grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] && grid[0][0] != ' '){
      winningLine =  [0, 0, 2, 2];
      return true;
    }
    if (grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] && grid[0][2] != ' '){
      winningLine = [0, 2, 2, 0];
      return true;
    }
    return false;
  }

  bool checkDrawCondition(){
    for (List<String> row in grid){
      for (String cell in row){
        if (cell == ' '){
          return false;
        }
      }
    }
    winningLine = null;
    return !checkWinCondition();
  }
}