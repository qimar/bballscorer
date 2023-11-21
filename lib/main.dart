import 'package:SportRabbit/screens/games_list/games_listview.dart';
import 'package:SportRabbit/screens/login.dart';
import 'package:flutter/material.dart';

// this entry point of flutter
void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        restorationScopeId: 'com.GamesRabbit.app',
        title: 'GamesRabbit',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 68, 9, 9)),
            useMaterial3: true),
        darkTheme: ThemeData.dark(),
        routes: {
          "/": (context) => const GamesListView(),
          "/logn": (context) => const LoginScreen(),
          //  "/": (context) => const HomePage(),
          // "/search_page": (context) => const SearchPage(),
          // "/player_page": (context) => const PlayerPage(),
        });
  }
}
