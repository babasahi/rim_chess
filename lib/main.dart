import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rim_chess/app.dart';
import 'package:rim_chess/controllers/game_state_provider.dart';
import 'package:rim_chess/services/database/supabase_keys.dart';
import 'package:rim_chess/views/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

List<Locale> appSupportedLocales = [
  const Locale('ar', 'AR'),
  const Locale('en', 'US'),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseURL,
    anonKey: supabaseKey,
  );
  runApp(const GameApp());
}
