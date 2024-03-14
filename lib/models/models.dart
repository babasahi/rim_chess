import 'package:flutter/material.dart';

enum SquareContent {
  whitePiece,
  blackPiece,
  empty,
}

class BoardPosition {
  final int rIndex;
  final int cIndex;
  BoardPosition({required this.cIndex, required this.rIndex});

  int sum() => cIndex + rIndex;
}
