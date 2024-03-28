import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rim_chess/controllers/game_state_provider.dart';
import 'package:rim_chess/views/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GameStateProvider(),
          builder: (context, child) {
            return const HomeScreen();
          },
        ),
      ),
    );
  }
}
