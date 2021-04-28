import 'package:flutter/material.dart';

import '../../../shared.dart';

class CustomButtonWhiteStroke extends StatefulWidget {
  final Function onPressed;
  final String text;
  final bool isValueEntered;


  CustomButtonWhiteStroke({Key key, this.onPressed, this.text, this.isValueEntered = true}) : super(key: key);

  @override
  _CustomButtonWhiteStroke createState() => _CustomButtonWhiteStroke();
}

class _CustomButtonWhiteStroke extends State<CustomButtonWhiteStroke> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          elevation: 0,
          color: ColorPalettes.lightBG,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: ColorPalettes.greyStroke
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
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          onPressed: widget.onPressed
      ),

    );
  }
}