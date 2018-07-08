import 'package:ekonsulta/appbar.dart';
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
  final PatientSearchDelegate _patientSearchDelegate = PatientSearchDelegate();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(context, widget.title, _patientSearchDelegate),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildCardColumn(['1', '2']),
              buildCardColumn(['1', '2']),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardColumn(List<String> text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          child: Text(text[0]),
        ),
        Card(
          child: Text(text[1]),
        ),
      ],
    );
  }
}
