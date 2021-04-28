import 'package:flutter/material.dart';

import '../../../shared.dart';

class CustomButtonPurpleSmall extends StatefulWidget {
  final Function onPressed;
  final String text;
  final bool isClickable;

  CustomButtonPurpleSmall({Key key, this.onPressed, this.text, this.isClickable = true}) : super(key: key);

  @override
  _CustomButtonPurpleSmall createState() => _CustomButtonPurpleSmall();
}

class _CustomButtonPurpleSmall extends State<CustomButtonPurpleSmall> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        elevation: 0,
        color: ColorPalettes.lightBG,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: ColorPalettes.lightPurple,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.dp6(context),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: ColorPalettes.lightPurple,
            fontFamily: 'Golos_Regular',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
        onPressed:  widget.isClickable ? widget.onPressed : null,
      ),

    );
  }
}