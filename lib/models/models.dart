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

class User {
  final int playerId;
  final String name;
  final String avatar;
  final String phoneNumber;
  final DateTime createdAt;
  final int rating;

  const User(
      {required this.playerId,
      required this.name,
      required this.avatar,
      required this.phoneNumber,
      required this.createdAt,
      required this.rating});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      playerId: json['playerId'],
      name: json['name'],
      avatar: json['avatar'],
      phoneNumber: json['phoneNumber'],
      createdAt: DateTime.parse(json['createdAt']),
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerId': playerId,
      'name': name,
      'avatar': avatar,
      'phoneNumber': phoneNumber,
      'createdAt': createdAt.toIso8601String(),
      'rating': rating,
    };
  }
}
