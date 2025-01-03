import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rim_chess/controllers/auth_provider.dart';
import 'package:rim_chess/main.dart';
import 'package:rim_chess/models/models.dart';
import 'package:rim_chess/scaffold_screen.dart';
import 'package:rim_chess/services/cache/caching.dart';
import 'package:rim_chess/views/screens/game_code_screen.dart';
import 'package:rim_chess/views/screens/home_screen.dart';

import 'views/screens/game_screen.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  Future<StartState> _startScreen() async {
    Player? u = await cachedUser();
    if (u != null) {
      return StartState(state: AppState.authenticated, user: u);
    } else {
      return StartState(state: AppState.unauthenticated, user: null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StartState>(
      future: _startScreen(),
      builder: (context, snapshot) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => AuthProvider(user: snapshot.data!.user),
            ),
          ],
          builder: (context, child) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return const SafeArea(child: Center());
            } else {
              if (snapshot.hasData && snapshot.data != null) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  locale: appSupportedLocales.first,
                  theme: ThemeData(
                    fontFamily: 'DINNext',
                  ),
                  home: const Directionality(
                    textDirection: TextDirection.rtl,
                    child: HomeScreen(),
                  ),
                );
              } else {
                return const SafeArea(
                    child: SizedBox(
                  child: Text('Something went wrong'),
                ));
              }
            }
          },
        );
      },
    );
  }
}
