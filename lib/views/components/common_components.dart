import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
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
      width: smallSize
          ? MediaQuery.of(context).size.height * 0.025
          : MediaQuery.of(context).size.height * 0.05,
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
      height: MediaQuery.of(context).size.height * 0.07,
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
                children: [
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
                  Text(isWhite
                      ? (Provider.of<GameStateProvider>(context)
                                  .numCapturedBlackPieces >
                              Provider.of<GameStateProvider>(context)
                                  .numCapturedWhitePieces
                          ? '+${Provider.of<GameStateProvider>(context).numCapturedBlackPieces - Provider.of<GameStateProvider>(context).numCapturedWhitePieces}'
                          : '')
                      : (Provider.of<GameStateProvider>(context)
                                  .numCapturedWhitePieces >
                              Provider.of<GameStateProvider>(context)
                                  .numCapturedBlackPieces
                          ? '+${Provider.of<GameStateProvider>(context).numCapturedWhitePieces - Provider.of<GameStateProvider>(context).numCapturedBlackPieces}'
                          : ''))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(kTertiaryColor),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
    required this.controller,
    required this.trailingIcon,
    required this.trailingIconTapped,
    required this.keyboardType,
    required this.textFieldWidth,
    required this.onChanged,
  });
  final Widget icon;
  final Widget? trailingIcon;
  final double textFieldWidth;
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  final Function trailingIconTapped;
  final Function onChanged;

  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: textFieldWidth,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context) * 0.05,
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          const SizedBox(width: 12),
          Flexible(
            child: SizedBox(
              child: TextFormField(
                onChanged: (v) {
                  onChanged();
                },
                onEditingComplete: () {
                  if (!FocusScope.of(context).hasPrimaryFocus) {
                    FocusScope.of(context).unfocus();
                  }
                },
                style: kNormalTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                controller: controller,
                obscureText: obscureText,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: kNormalTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
          trailingIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: trailingIcon,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.activated,
    required this.smallTitle,
  });
  final String label;
  final Function onTap;
  final Widget? icon;
  final bool activated;
  final bool smallTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: screenHeight(context) * 0.052,
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth(context) * 0.03,
        ),
        decoration: BoxDecoration(
          color: activated ? kPrimaryColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight(context) * 0.001,
          horizontal: screenWidth(context) * 0.05,
        ),
        child: Center(
          child: icon == null
              ? Text(
                  label,
                  style: kHeadingStyle.copyWith(
                      fontWeight:
                          activated ? FontWeight.bold : FontWeight.normal,
                      fontSize: smallTitle ? 14 : 20,
                      color: activated ? kBackgroundColor : kSecondaryColor),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    icon!,
                    SizedBox(width: screenWidth(context) * 0.25),
                    Text(
                      label,
                      style: kHeadingStyle.copyWith(
                          fontWeight:
                              activated ? FontWeight.bold : FontWeight.normal,
                          color:
                              activated ? kBackgroundColor : kSecondaryColor),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

void showAppSnackBar(String message, bool success, context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 1,
    margin: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.1),
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    backgroundColor: Colors.transparent,
    content: Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: success ? Colors.greenAccent : Colors.redAccent,
      child: Center(
        child: Text(
          message,
          style: kHeadingStyle.copyWith(
            color: success ? kSecondaryColor : kBackgroundColor,
            fontSize: 14,
          ),
        ),
      ),
    ),
  ));
}
