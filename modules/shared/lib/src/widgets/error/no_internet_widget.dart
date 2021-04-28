import 'package:flutter/material.dart';

import '../../../shared.dart';

class NoInternetWidget extends StatelessWidget {
  final String message;
  final Function onPressed;

  const NoInternetWidget({Key key, this.message, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Golos',
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(height: 10),
          RaisedButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.dp10(context)),
            ),
            icon: Icon(Icons.wifi),
            onPressed: onPressed,
            label: Text(
              'No internet',
              style: TextStyle(
                color: ColorPalettes.white,
                fontFamily: 'Golos_Regular',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            )
          ),
        ],
      )
    );
  }
}
