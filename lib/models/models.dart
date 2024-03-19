import 'package:equatable/equatable.dart';

enum SquareContent {
  whitePiece,
  blackPiece,
  empty,
}

class BoardPosition extends Equatable {
  final int rIndex;
  final int cIndex;

  const BoardPosition({required this.cIndex, required this.rIndex});

  int sum() => cIndex + rIndex;

  @override
  List<Object?> get props => [rIndex, cIndex];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoardPosition &&
        other.rIndex == rIndex &&
        other.cIndex == cIndex;
  }

  @override
  int get hashCode => rIndex.hashCode ^ cIndex.hashCode;
}
