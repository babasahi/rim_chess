import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rim_chess/views/components/common_components.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/controllers/game_state_provider.dart';
import 'package:rim_chess/models/models.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
          child: ChangeNotifierProvider(
        create: (context) => GameStateProvider(),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.25),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlayerWidget(
                  playerName: 'Babe Saleh Mahfoud',
                  isWhite: true,
                ),
                SizedBox(height: 32),
                GameBoard(),
                SizedBox(height: 32),
                PlayerWidget(
                  playerName: 'Nessibe Checikhna Nettah',
                  isWhite: false,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
          height: boardHeight(context),
          width: boardWidth(context),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              8,
              (cIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  8,
                  (rIndex) => BoardPiece(
                    position: BoardPosition(cIndex: cIndex, rIndex: rIndex),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
/*
GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: boardLength,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8),
          itemBuilder: (context, index) {
            if (changeIndexes.contains(index)) {
              _firstIsWhite = !_firstIsWhite;
            }
            return BoardPiece(index: index, firstIsWhite: _firstIsWhite);
          },
        ),
*/