import 'package:flutter/material.dart';

import '../../../shared.dart';

class CustomButtonWhite extends StatefulWidget {
  final Function onPressed;
  final String text;
  final bool isClickable;

  CustomButtonWhite({Key key, this.onPressed, this.text, this.isClickable = true}) : super(key: key);

  @override
  _CustomButtonStateWhite createState() => _CustomButtonStateWhite();
}

class _CustomButtonStateWhite extends State<CustomButtonWhite> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context) * .9,
      child: RaisedButton(
        elevation: 0,
        color: widget.isClickable ? ColorPalettes.lightBG : ColorPalettes.greyStroke,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: widget.isClickable ? ColorPalettes.greyButton : ColorPalettes.greyButton,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.dp6(context),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isClickable ? ColorPalettes.textColorGrey : ColorPalettes.white,
            fontFamily: 'Golos_Regular',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        onPressed:  widget.isClickable ? widget.onPressed : null,
      ),

    );
  }
}