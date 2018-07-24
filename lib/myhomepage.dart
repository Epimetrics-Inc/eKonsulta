import 'dart:math';

import 'package:ekonsulta/appbar.dart';
import 'package:ekonsulta/drawer.dart';
import 'package:ekonsulta/search/search.dart';
import 'package:flutter/material.dart';

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
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 10.0,
            ),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: buildCards(generateDummyCaseData()),
          ),
        ),
      ),
    );
  }

  List<Widget> buildCards(List<CaseData> caseDataList) {
    List<Widget> cardList = <Widget>[];

    for (CaseData caseData in caseDataList) {
      cardList.add(createCard(caseData));
    }

    return cardList;
  }

  final rng = Random();

  Widget createCard(CaseData caseData) {
    return Card(
      color: Colors.blue,
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Icon(caseData.icon, color: Colors.white, size: 48.0),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 4.0,
                  ),
                  child: Text(
                    caseData.text,
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.25,
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                  top: 24.0,
                  left: 16.0,
                  right: 16.0,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 4.0, top: 2.0, left: 16.0, right: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          caseData.unread.toString(),
                          textScaleFactor: 1.25,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Text(caseData.total.toString(), textScaleFactor: 1.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Unread', textScaleFactor: 1.25),
                          Text('Cases', textScaleFactor: 1.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CaseData {
  IconData icon;
  String text;
  int unread, total;

  CaseData(this.icon, this.text, this.unread, this.total);
}

List<CaseData> generateDummyCaseData() {
  List<CaseData> caseDataList = <CaseData>[];
  const texts = <String>[
    'Unsorted\nCases',
    'Pediatric\nCases',
    'Geriatric\nCases',
    'Maternal\nCases',
    'Misc\nCases',
    'TB\nCases'
  ];
  const icons = <IconData>[
    Icons.help_outline,
    Icons.child_care,
    Icons.accessibility,
    Icons.pregnant_woman,
    Icons.question_answer,
    Icons.warning
  ];

  const unread = <int>[10, 22, 33, 44, 55, 66];

  const total = <int>[100, 22, 330, 404, 515, 66];

  for (int i = 0; i < texts.length; i++) {
    caseDataList.add(CaseData(icons[i], texts[i], unread[i], total[i]));
  }
  return caseDataList;
}
