import 'package:ekonsulta/drawer.dart';
import 'package:ekonsulta/search/search.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eKonsulta',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'eKonsulta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SearchDemoSearchDelegate _delegate = SearchDemoSearchDelegate();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _lastIntegerSelected;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(title: Text(widget.title), actions: <Widget>[
      IconButton(
        tooltip: 'Search',
        icon: const Icon(Icons.search),
        onPressed: () async {
          final int selected = await showSearch<int>(
            context: context,
            delegate: _delegate,
          );
          if (selected != null && selected != _lastIntegerSelected) {
            setState(() {
              _lastIntegerSelected = selected;
            });
          }
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(context),
      drawer: AppDrawer(),
      body: Center(child: Text('This is eKonsulta.')),
    );
  }
}
