import 'package:flutter/material.dart';
import 'package:rim_chess/models/models.dart';

double boardWidth(BuildContext context) =>
    MediaQuery.of(context).size.height * 0.6;

double boardHeight(BuildContext context) =>
    MediaQuery.of(context).size.height * 0.6;

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
