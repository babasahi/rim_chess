import 'package:flutter/widgets.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/models/models.dart';

class GameStateProvider extends ChangeNotifier {
  bool _whiteTurn = true;
  BoardPosition? _touchedPiece;
  int _numCapturedWhitePieces = 0;
  int _numCapturedBlackPieces = 0;
  final List<List<SquareContent>> _board = initialBoard;

  List<List<SquareContent>> get board => _board;
  BoardPosition? get touchedPiece => _touchedPiece;
  bool get whiteTurn => _whiteTurn;
  int get numCapturedWhitePieces => _numCapturedWhitePieces;
  int get numCapturedBlackPieces => _numCapturedBlackPieces;

  bool positionIsWhite(BoardPosition position) =>
      _board[position.cIndex][position.rIndex] == SquareContent.whitePiece;
  void reverseTurn() => _whiteTurn = !_whiteTurn;

  void pieceTapped(BoardPosition newPosition) {
    if (_touchedPiece == null) {
      if (whiteTurn) {
        if (positionIsWhite(newPosition)) {
          _touchedPiece = newPosition;
          notifyListeners();
        }
      } else {
        if (!positionIsWhite(newPosition)) {
          _touchedPiece = newPosition;
          notifyListeners();
        }
      }
    } else {
      if (newPosition != _touchedPiece) {
        destinationTapped(newPosition);
      }
    }
  }

  void destinationTapped(BoardPosition newPosition) {
    if (isReacheable(_touchedPiece!, newPosition)) {
      if (isEnemyPiece(_touchedPiece!, newPosition)) {
        killPiece(_touchedPiece!, newPosition);
      } else {
        movePiece(_touchedPiece!, newPosition);
      }
    }
  }

  bool isReacheable(BoardPosition self, BoardPosition target) {
    return ([-2, 0, 2].contains(self.sum() - target.sum()) &&
        (self.cIndex != target.cIndex && self.rIndex != target.rIndex));
  }

  bool isEnemyPiece(BoardPosition self, BoardPosition target) =>
      _board[self.cIndex][self.rIndex] !=
          _board[target.cIndex][target.rIndex] &&
      _board[target.cIndex][target.rIndex] != SquareContent.empty;

  void movePiece(BoardPosition oldPosition, BoardPosition newPosition) {
    _board[newPosition.cIndex][newPosition.rIndex] =
        _board[oldPosition.cIndex][oldPosition.rIndex];
    _board[oldPosition.cIndex][oldPosition.rIndex] = SquareContent.empty;
    _touchedPiece = null;
    reverseTurn();
    notifyListeners();
  }

  void killPiece(BoardPosition killer, BoardPosition killed) {
    if (positionIsWhite(killed) != positionIsWhite(killer)) {
      SquareContent k = _board[killer.cIndex][killer.rIndex];
      _board[killer.cIndex][killer.rIndex] = SquareContent.empty;
      _board[killed.cIndex][killed.rIndex] = k;
      if (k == SquareContent.blackPiece) {
        _numCapturedWhitePieces++;
      } else {
        _numCapturedBlackPieces++;
      }
      _touchedPiece = null;
      reverseTurn();
      notifyListeners();
    }
  }
}
