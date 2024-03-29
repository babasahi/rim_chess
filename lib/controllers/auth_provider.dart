import 'package:flutter/material.dart';
import 'package:rim_chess/models/models.dart';

class AuthProvider extends ChangeNotifier {
  Player? user;
  AuthProvider({required this.user});

  Player? get currentUser => user;

  void setUser(Player? newUser) {
    user = newUser;
    notifyListeners();
  }

  void logout() {
    user = null;
    notifyListeners();
  }
}
