import 'package:flutter/material.dart';
import 'package:rim_chess/constants.dart';

class GameCodeScreen extends StatefulWidget {
  const GameCodeScreen({super.key});

  @override
  State<GameCodeScreen> createState() => _GameCodeScreenState();
}

class _GameCodeScreenState extends State<GameCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: screenPadding(context),
            child: Column(
              children: [
                const Text(''),
                SizedBox(height: screenHeight(context) * 0.01),
                const TextField()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
