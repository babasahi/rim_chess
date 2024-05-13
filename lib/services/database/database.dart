import 'dart:math';

import 'package:rim_chess/constants.dart';
import 'package:rim_chess/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String avatarUrl = 'https://source.boringavatars.com/beam/100';

final supabase = Supabase.instance.client;

Stream<GameMove> movesStream() async* {
  for (var i = 0; i < 8; i++) {
    print("new loop");
    yield await Future.delayed(
        Duration(milliseconds: Random.secure().nextInt(900)), () async {
      return GameMove(
        gameMoveId: 8,
        gameId: Random.secure().nextInt(1000),
        playerId: 3,
        oldPosition: BoardPosition.fromJson({
          'cIndex': Random.secure().nextInt(8),
          'rIndex': Random.secure().nextInt(8)
        }),
        newPosition: BoardPosition.fromJson({
          'cIndex': Random.secure().nextInt(8),
          'rIndex': Random.secure().nextInt(8)
        }),
        createdAt: DateTime.now(),
      );
    });
  }
  print('streamfunction ended');
}

Future<Player?> player(int id) async {
  try {
    final data = await supabase.from('players').select().eq('playerId', id);
    return Player.fromJson(data.first);
  } catch (e) {
    print(e);
    return null;
  }
}
