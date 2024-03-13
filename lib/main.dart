import 'package:flutter/material.dart';
import 'package:prodigy_ad_04/pages/home_page.dart';
import 'package:prodigy_ad_04/pages/tic_tac_toe_page.dart';
import 'package:prodigy_ad_04/provider/tic_tac_toe_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TicTacToeProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyTicTacToe()
      )
    );
  }
}