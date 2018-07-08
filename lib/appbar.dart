import 'package:ekonsulta/search/search.dart';
import 'package:flutter/material.dart';

Widget buildAppBar(
    BuildContext context, String title, PatientSearchDelegate searchDelegate) {
  return AppBar(title: Text(title), actions: <Widget>[
    IconButton(
      tooltip: 'Search',
      icon: const Icon(Icons.search),
      onPressed: () async {
        await showSearch<int>(
          context: context,
          delegate: searchDelegate,
        );
      },
    ),
  ]);
}
