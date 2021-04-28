import 'package:shared/shared.dart';

import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Neo panel')),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('autorization'),
                style: TextStyle(fontSize: 50)),
            RaisedButton(
              child: Text('Go to first'),
              onPressed: () {
                // Pushing a named route
                Navigator.of(context).pop();
              },
            )
          ],
        )));
  }
}
