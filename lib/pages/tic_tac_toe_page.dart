import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors/app_colors.dart';
import '../provider/tic_tac_toe_provider.dart';

class MyTicTacToe extends StatefulWidget {
  const MyTicTacToe({super.key});

  @override
  State<MyTicTacToe> createState() => _MyTicTacToeState();
}

class _MyTicTacToeState extends State<MyTicTacToe> {
  @override
  Widget build(BuildContext context) {
    final ticTacToeProvider = Provider.of<TicTacToeProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors:  [
              AppColors.primaryGradientColor1,
              AppColors.primaryGradientColor2,
            ]
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 90),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index){
                  int x = index % 3;
                  int y = index ~/ 3;
                  return GestureDetector(
                    onTap: () => ticTacToeProvider.handleMove(x, y),
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, bottom: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ticTacToeProvider.grid[y][x] == ' '? AppColors.squareBoxColor : (ticTacToeProvider.grid[y][x] == 'X'? AppColors.button2GradientColor2 : AppColors.button1GradientColor2),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: ticTacToeProvider.grid[y][x] == ' '? AppColors.squareBoxColor : (ticTacToeProvider.grid[y][x] == 'X'? AppColors.button2GradientColor1 : AppColors.button1GradientColor1),
                          width: 2
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ticTacToeProvider.grid[y][x] == ' '? AppColors.squareBoxColor.withOpacity(.6) : (ticTacToeProvider.grid[y][x] == 'X'? AppColors.button2GradientColor1 : AppColors.button1GradientColor1),
                            offset: const Offset(2, 5),
                            blurRadius: 5,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Text(
                        ticTacToeProvider.grid[y][x],
                        style: TextStyle(
                          fontSize: 44,
                          color: ticTacToeProvider.grid[y][x] == 'X' ? AppColors.playerOneColor : AppColors.playerTwoColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
