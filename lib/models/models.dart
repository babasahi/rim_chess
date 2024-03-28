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

class Player {
  final int playerId;
  final String name;
  final String phoneNumber;
  final DateTime createdAt;
  final int rating;

  const Player(
      {required this.playerId,
      required this.name,
      required this.phoneNumber,
      required this.createdAt,
      required this.rating});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerId: json['playerId'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      createdAt: DateTime.parse(json['createdAt']),
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerId': playerId,
      'name': name,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
      'rating': rating,
    };
  }
}

class Game {
  final int gameId;
  final DateTime createdAt;
  final int whitePlayerId;
  final int blackPlayerId;
  final bool whiteWon;

  const Game(
      {required this.gameId,
      required this.createdAt,
      required this.whitePlayerId,
      required this.blackPlayerId,
      required this.whiteWon});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      gameId: json['gameId'],
      createdAt: DateTime.parse(json['createdAt']),
      whitePlayerId: json['whitePlayerId'],
      blackPlayerId: json['blackPlayerId'],
      whiteWon: json['whiteWon'],
    );
  }
}

class GameState {
  final int gameStateId;
  final int gameId;
  final int playerId;
  final int numCapturedWhitePieces;
  final int numCapturedBlackPieces;
  final List<List<int>> state;
  final DateTime createdAt;

  const GameState(
      {required this.gameStateId,
      required this.gameId,
      required this.playerId,
      required this.numCapturedWhitePieces,
      required this.numCapturedBlackPieces,
      required this.state,
      required this.createdAt});

  factory GameState.fromJson(Map<String, dynamic> json) {
    return GameState(
      gameStateId: json['gameStateId'],
      gameId: json['gameId'],
      playerId: json['playerId'],
      numCapturedWhitePieces: json['numCapturedWhitePieces'],
      numCapturedBlackPieces: json['numCapturedBlackPieces'],
      state: json['state'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class FriendShip {
  final int friendShipId;
  final int inviterId;
  final int invetedId;
  final DateTime createdAt;
  final String state;

  const FriendShip({
    required this.friendShipId,
    required this.inviterId,
    required this.invetedId,
    required this.createdAt,
    required this.state,
  });
}
