

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // required to add padding to change status bar color
        // https://github.com/flutter/flutter/issues/13604
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                )),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Create New Case Category'),
            onTap: () {
              final snackBar =
              SnackBar(content: Text('Pressed Create Case Category'));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),
    );
  }
}
