import 'package:flutter/material.dart';

import '../../../shared.dart';

class CustomButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final bool isClickable;

  CustomButton({Key key, this.onPressed, this.text, this.isClickable = true}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sizes.width(context) * .9,
        child: RaisedButton(
          elevation: 0,
          color: widget.isClickable ? ColorPalettes.deepPurple : ColorPalettes.greyStroke,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Sizes.dp6(context),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: ColorPalettes.white,
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