import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/logic/levels.dart';
import 'package:myapp/logic/provider.dart';
import 'package:myapp/pages/game.dart';
import 'package:myapp/pages/intro.dart';
import 'package:myapp/pages/levels_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Intro(),
      routes: [
        GoRoute(
          path: 'levels',
          builder: (context, state) => LevelsScreen(),
          routes: [
            GoRoute(
              path: ':id/game',
              builder: (context, state) {
                Level currentLevel = state.extra as Level;
                return GameScreen(currentLevel: currentLevel);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesWithCache storage = await SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: {'money', 'level'},
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainProvider(storage: storage),
      builder: (context, child) => const MyWidget(),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router, debugShowCheckedModeBanner: false,);
  }
}
