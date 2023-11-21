import 'package:SportRabbit/providers/GamesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamesListView extends StatefulWidget {
  const GamesListView({super.key});

  @override
  State<GamesListView> createState() => _GamesListViewState();
}

class _GamesListViewState extends State<GamesListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            // backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text('Games List',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: <Widget>[
              // notification icon
              IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // do something
                  }),
            ]),
        body: Consumer<GamesProvider>(builder: (context, gamesProvider, child) {
          return ListView.builder(
              itemCount: gamesProvider.gamesCount,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(gamesProvider.games[index].title!),
                    subtitle: Text(gamesProvider.games[index].difficulty!));
              });
        }));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Widget Example'),
        ),
        body: const MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 3')),
        // Add more items as needed
      ],
    );
  }
}
