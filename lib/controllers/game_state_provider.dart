import 'package:flutter/widgets.dart';
import 'package:rim_chess/constants.dart';
import 'package:rim_chess/models/models.dart';

class GameStateProvider extends ChangeNotifier {
  bool _whiteTurn = true;
  BoardPosition? _highlightedPiece;
  int _numCapturedWhitePieces = 0;
  int _numCapturedBlackPieces = 0;
  final List<List<SquareContent>> _board = initialBoard;

  List<List<SquareContent>> get board => _board;
  BoardPosition? get highlightedPiece => _highlightedPiece;
  bool get whiteTurn => _whiteTurn;
  int get numCapturedWhitePieces => _numCapturedWhitePieces;
  int get numCapturedBlackPieces => _numCapturedBlackPieces;

  bool pieceIsWhite(BoardPosition position) =>
      _board[position.cIndex][position.rIndex] == SquareContent.whitePiece;

  void reverseTurn() => _whiteTurn = !_whiteTurn;

  void pieceTapped(BoardPosition newPosition) {
    if (_highlightedPiece == null) {
      print('Highlight tap');
      if (whiteTurn) {
        if (pieceIsWhite(newPosition)) {
          print('White tapped his piece, highlight it.');
          _highlightedPiece = newPosition;
          notifyListeners();
        }
      } else {
        print('black s turn.');
        if (!pieceIsWhite(newPosition)) {
          print('black tapped his piece, highlight it.');
          _highlightedPiece = newPosition;
          notifyListeners();
        }
      }
    } else {
      print('This is action tap.');
      if (newPosition != _highlightedPiece) {
        print('Destination is diffrent than self');

        destinationTapped(newPosition);
      }
    }
  }

  void destinationTapped(BoardPosition newPosition) {
    if (isReacheable(_highlightedPiece!, newPosition)) {
      print('print piece is reachaeble');
      if (isEnemyPiece(_highlightedPiece!, newPosition)) {
        print('piece is enemy piece');
        killPiece(_highlightedPiece!, newPosition);
      } else {
        print('piece is not enemy');
        movePiece(_highlightedPiece!, newPosition);
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
    _highlightedPiece = null;
    reverseTurn();
    notifyListeners();
  }

  void killPiece(BoardPosition killer, BoardPosition killed) {
    SquareContent k = _board[killer.cIndex][killer.rIndex];
    _board[killer.cIndex][killer.rIndex] = SquareContent.empty;
    _board[killed.cIndex][killed.rIndex] = k;
    if (k == SquareContent.blackPiece) {
      _numCapturedWhitePieces++;
    } else {
      _numCapturedBlackPieces++;
    }
    _highlightedPiece = null;
    reverseTurn();
    notifyListeners();
  }
}
