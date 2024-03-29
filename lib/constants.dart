import 'package:flutter/material.dart';
import 'package:rim_chess/models/models.dart';

TextStyle kSelectedIconLabelStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: kPrimaryColor,
);
TextStyle kUnSelectedIconLabelStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: kIconsColor,
);

TextStyle kLogoTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 48,
  color: kPrimaryColor,
);

TextStyle kNormalTextStyle = const TextStyle(
  fontSize: 16,
  color: Colors.black,
);

TextStyle kHeadingStyle = TextStyle(
  fontSize: 20,
  color: Colors.black.withOpacity(0.9),
  fontWeight: FontWeight.w600,
);
// Colors

const Color kPrimaryColor = Color(0xFF4A4A4A);
const Color kBackgroundColor = Color(0xFFFFFFFF);
const Color kSecondaryColor = Color(0xFFF5F5F5);
const Color kTertiaryColor = Color(0xFFDD1D45);
const Color kDarkBackgroundColor = Color(0xFFF6F6F6);
const Color kIconsColor = Color(0XFFD9D9D9);
const Color kBorderColor = Color(0XFFC9C9C9);
const Color kYellowColor = Color(0xFFFEF8E2);

Color kAlertColor = const Color(0xFFF51010);
Color kSuccessColor = const Color(0xFF22C55E);

Color kLoadingTransparentColor = Colors.white.withOpacity(0.5);

// layout constants

double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;
double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;
EdgeInsetsGeometry screenPadding(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: screenWidth(context) * 0.066,
    vertical: screenHeight(context) * 0.015,
  );
}

double boardWidth(BuildContext context) =>
    MediaQuery.of(context).size.height * 0.8;

double boardHeight(BuildContext context) =>
    MediaQuery.of(context).size.height * 0.4;

double pieceHeight(BuildContext context) =>
    MediaQuery.of(context).size.height * 0.045;

double pieceWidth(BuildContext context) =>
    MediaQuery.of(context).size.height * 0.045;
const int boardLength = 64;

const Color whiteSqureColor = Colors.white12;
const Color blackSqureColor = Colors.black12;
Color touchedSquareColor = Colors.deepPurpleAccent.shade100;

List<List<bool>> boardsPattern = [
  [false, true, false, true, false, true, false, true],
  [true, false, true, false, true, false, true, false],
  [false, true, false, true, false, true, false, true],
  [true, false, true, false, true, false, true, false],
  [false, true, false, true, false, true, false, true],
  [true, false, true, false, true, false, true, false],
  [false, true, false, true, false, true, false, true],
  [true, false, true, false, true, false, true, false],
];

List<List<SquareContent>> initialBoard = [
  [
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
  ],
  [
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
    SquareContent.whitePiece,
  ],
  [
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
  ],
  [
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
  ],
  [
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
  ],
  [
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
    SquareContent.empty,
  ],
  [
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
  ],
  [
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
    SquareContent.blackPiece,
  ],
];
