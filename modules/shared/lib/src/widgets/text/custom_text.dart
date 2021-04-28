import '../../../shared.dart';

import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {

  final String text;
  final bool isRequiredField;

  const CustomText({Key key, this.text, this.isRequiredField}) : super(key: key);

  @override
  _CustomText createState() => _CustomText();
}

class _CustomText extends State<CustomText> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context) * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(widget.text,
              style: TextStyle(
                  color: ColorPalettes.textColorGrey,
                  fontFamily: 'Golos',
                  fontSize: 13,
                  fontWeight: FontWeight.w500
              )),
          Visibility(
            visible: widget.isRequiredField??true ? true : false,
              child: Text('*',
                  style: TextStyle(color: ColorPalettes.red,
                      fontWeight: FontWeight.w700)),
          )
        ],
      ),
    );
  }
}