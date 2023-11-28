import 'package:SportRabbit/providers/GamesProvider.dart';
import 'package:SportRabbit/providers/UserProvider.dart';
import 'package:SportRabbit/screens/drills_list/drills_list.dart';
import 'package:SportRabbit/screens/games_list/games_list.dart';
import 'package:SportRabbit/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// this entry point of flutter
void main() {
  runApp(const GamesRabbitApp());
}

class GamesRabbitApp extends StatelessWidget {
  const GamesRabbitApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => GamesProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'com.GamesRabbit.app',
          title: 'GamesRabbit',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 68, 9, 9)),
              useMaterial3: true),
          darkTheme: ThemeData.dark(),
          routes: {
            "/": (context) => GamesListView(),
            "/logn": (context) => const LoginScreen(),
            // drill list
            // "/drills_list": (context) => DrillsListView(),
            //  "/": (context) => const HomePage(),
            // "/search_page": (context) => const SearchPage(),
            // "/player_page": (context) => const PlayerPage(),
          }),
    );
  }
}
