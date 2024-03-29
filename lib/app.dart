import 'package:flutter/material.dart';

class TraineeApp extends StatefulWidget {
  const TraineeApp({super.key});

  @override
  State<TraineeApp> createState() => _TraineeAppState();
}

class _TraineeAppState extends State<TraineeApp> {
  Future<StartState> _startScreen() async {
    User? u = await cachedUser();
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
            ChangeNotifierProvider(
              create: (context) => LoadingProvider(),
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
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  theme: ThemeData(
                    fontFamily: Provider.of<LocaleProvider>(context)
                                .currentLocale
                                .countryCode ==
                            'US'
                        ? 'Poppins'
                        : 'DINNext',
                  ),
                  home: StartState.mapStateToScreen(snapshot.data!.state),
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
