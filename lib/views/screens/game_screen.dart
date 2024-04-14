import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/services/database/database.dart';
import 'package:rim_chess/views/components/common_components.dart';
import 'package:rim_chess/controllers/game_state_provider.dart';
import 'package:rim_chess/models/models.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  void showGameFinished(BuildContext context, int winnerId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              width: screenWidth(context) * 0.88,
              height: screenHeight(context) * 0.4,
              margin: EdgeInsets.only(bottom: screenHeight(context) * 0.4),
              padding: EdgeInsets.symmetric(
                horizontal: screenHeight(context) * 0.043,
                vertical: screenHeight(context) * 0.03,
              ),
              child: Column(
                children: [
                  Text(
                    'Fucked',
                    style: kHeadingStyle.copyWith(
                      color: kBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: ChangeNotifierProvider(
        create: (context) => GameStateProvider(),
        builder: (context, child) {
          return Padding(
            padding: screenPadding(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showGameFinished(context, 7);
                  },
                  child: const PlayerWidget(
                    playerName: 'Babe Saleh Mahfoud',
                    isWhite: true,
                  ),
                ),
                const GameBoard(),
                const PlayerWidget(
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
    return StreamBuilder<GameMove>(
        stream: movesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.gameId);
            Provider.of<GameStateProvider>(context, listen: false)
                .setBoard(snapshot.data!.state);
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
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
                          position:
                              BoardPosition(cIndex: cIndex, rIndex: rIndex),
                        ),
                      ),
                    ),
                  ),
                )),
          );
        });
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