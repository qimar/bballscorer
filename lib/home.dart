import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String _name = "Ramiq";
  String _title = "Flutter Demo Home Page";

  void _incrementCounter() {
    setState(() {
      _name = "Ramiq Waqas";
      _counter++;

      if (_counter == 10) {
        _title = "Flutter 10";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

            // backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text('$_title}',
                style: Theme.of(context).textTheme.headlineMedium),
            actions: <Widget>[
              // video call icon
              IconButton(
                  icon: const Icon(Icons.video_call),
                  tooltip: 'Video Call',
                  onPressed: () {
                    print('Video Call button pressed');
                  }),
              // voice call icon
              IconButton(
                  icon: const Icon(Icons.call),
                  tooltip: 'Voice Call',
                  onPressed: () {
                    print('Voice Call button pressed');
                  })
            ]),
        drawer: Drawer(
            child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  child: Text('Ramiq Waqas')),
              ListTile(
                  leading: Icon(Icons.home),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.train),
                  title: const Text('Log Out'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  })
            ])),
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Container(
                width: 400,
                height: 400,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 0.5)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('You have pushed the button this many times:'),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        '${_name} ${_counter}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ]))),
        floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add)));
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
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
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
