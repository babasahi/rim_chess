import 'package:rim_chess/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> userLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('fares_trainee_userLoggedIn') ?? false;
}

Future<void> setUserLoggedIn(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('fares_trainee_userLoggedIn', value);
}

Future<Player?> cachedUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('rim_chess_userName');
  String? phone = prefs.getString('rim_chess_userPhone');
  int? id = prefs.getInt('rim_chess_userId');
  String? createdAt = prefs.getString('rim_chess_userCreatedAt');
  int? rating = prefs.getInt('rim_chess_userRating');

  if (name != null &&
      createdAt != null &&
      phone != null &&
      rating != null &&
      id != null) {
    return Player(
      playerId: id,
      name: name,
      phoneNumber: phone,
      createdAt: DateTime.parse(createdAt),
      rating: rating,
    );
  } else {
    return null;
  }
}

Future<bool> cacheNewUser(Player newUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    await setUserLoggedIn(true);
    await prefs.setString('rim_chess_userName', newUser.name);
    await prefs.setString('rim_chess_userPhone', newUser.phoneNumber);
    await prefs.setInt('rim_chess_userRating', newUser.rating);
    await prefs.setString(
        'rim_chess_userCreatedAt', newUser.createdAt.toIso8601String());
    await prefs.setInt('rim_chess_userId', newUser.playerId);

    return true;
  } catch (e) {
    return false;
  }
}
