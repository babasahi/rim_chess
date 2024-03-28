import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/controllers/game_state_provider.dart';
import 'package:rim_chess/models/models.dart';

class BoardPiece extends StatefulWidget {
  const BoardPiece({
    super.key,
    required this.position,
  });
  final BoardPosition position;

  @override
  State<BoardPiece> createState() => _BoardPieceState();
}

class _BoardPieceState extends State<BoardPiece> {
  Widget getSquareContentWidget(SquareContent squareContent) {
    switch (squareContent) {
      case SquareContent.blackPiece:
        return const BlackPiece(
          smallSize: false,
        );
      case SquareContent.whitePiece:
        return const WhitePiece(
          smallSize: false,
        );
      case SquareContent.empty:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final player = AudioPlayer();
        await player.setAsset('assets/sounds/capture.mp3');
        await player.play();
        Provider.of<GameStateProvider>(context, listen: false)
            .pieceTapped(widget.position);
      },
      child: Container(
        height: pieceHeight(context),
        width: pieceWidth(context),
        decoration: BoxDecoration(
          color: Provider.of<GameStateProvider>(context).highlightedPiece ==
                  widget.position
              ? touchedSquareColor
              : boardsPattern
                      .elementAt(widget.position.cIndex)[widget.position.rIndex]
                  ? whiteSqureColor
                  : blackSqureColor,
        ),
        child: Animate(
            effects: const [FadeEffect(duration: Duration(seconds: 3))],
            onInit: (controller) {},
            child: Provider.of<GameStateProvider>(context).board.elementAt(
                        widget.position.cIndex)[widget.position.rIndex] ==
                    SquareContent.empty
                ? const SizedBox()
                : (Provider.of<GameStateProvider>(context).board.elementAt(
                            widget.position.cIndex)[widget.position.rIndex] ==
                        SquareContent.blackPiece
                    ? const BlackPiece(
                        smallSize: false,
                      )
                    : const WhitePiece(
                        smallSize: false,
                      ))
            /* Center(
                  child: Text(
                      '${widget.position.cIndex},${widget.position.rIndex}'))
             */

            ),
      ),
    );
  }
}

class BlackPiece extends StatelessWidget {
  const BlackPiece({super.key, required this.smallSize});
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/black_pawn.svg',
      height: smallSize
          ? MediaQuery.of(context).size.height * 0.025
          : MediaQuery.of(context).size.height * 0.05,
    );
  }
}

class WhitePiece extends StatelessWidget {
  const WhitePiece({super.key, required this.smallSize});
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/white_pawn.svg',
      height: smallSize
          ? MediaQuery.of(context).size.height * 0.025
          : MediaQuery.of(context).size.height * 0.05,
    );
  }
}

class PlayerWidget extends StatelessWidget {
  const PlayerWidget(
      {super.key, required this.playerName, required this.isWhite});
  final String playerName;
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: boardWidth(context),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.grey.shade100.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 8),
          const CircleAvatar(),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                playerName,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: List.generate(
                  isWhite
                      ? Provider.of<GameStateProvider>(context)
                          .numCapturedBlackPieces
                      : Provider.of<GameStateProvider>(context)
                          .numCapturedWhitePieces,
                  (index) => isWhite
                      ? const BlackPiece(smallSize: true)
                      : const WhitePiece(smallSize: true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
