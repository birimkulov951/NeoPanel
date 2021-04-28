import 'package:flutter/material.dart';

import '../../../shared.dart';

class CustomButtonPurpleStroke extends StatefulWidget {
  final Function onPressed;
  final String text;
  final bool isValueEntered;


  CustomButtonPurpleStroke({Key key, this.onPressed, this.text, this.isValueEntered = true}) : super(key: key);

  @override
  _CustomButtonPurpleStroke createState() => _CustomButtonPurpleStroke();
}

class _CustomButtonPurpleStroke extends State<CustomButtonPurpleStroke> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        elevation: 0,
        color: ColorPalettes.lightBG,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: ColorPalettes.deepPurple
          ),
          borderRadius: BorderRadius.circular(
            Sizes.dp6(context),
          ),
        ),
        child: Text(
          widget.text??'',
          style: TextStyle(
            color: widget.isValueEntered ? ColorPalettes.textColorBlack : ColorPalettes.textColorGrey,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
        padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
        onPressed: widget.onPressed
      ),

    );
  }
}