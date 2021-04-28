import '../../../shared.dart';
import 'package:flutter/material.dart';

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({Key key, this.text, this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            transform: Matrix4.translationValues(0.0, -7.5, 0.0),
            child: Divider(
              height: 0,
              thickness: 1,
              color: ColorPalettes.greyStroke,
              indent: 0,
              endIndent: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 7, bottom: 7, end: 20),
            child: Text(
                text,
            style: TextStyle(
                color: ColorPalettes.textColorBlack,
                fontFamily: 'Golos_SemiBold',
                fontSize: 15,
                fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    );
  }
}