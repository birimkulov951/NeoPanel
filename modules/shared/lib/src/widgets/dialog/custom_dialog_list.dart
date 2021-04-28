
import '../../../shared.dart';

import 'package:flutter/material.dart';

class CustomDialogList extends StatefulWidget {

  final String title;
  final List<String> listData;

  const CustomDialogList({Key key, @required this.listData, this.title}) : super(key: key);

  _CustomDialogList createState() => _CustomDialogList();
}

class _CustomDialogList extends State<CustomDialogList> {



  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(widget.title),
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: ColorPalettes.textColorBlack,
        fontFamily: 'Golos',
        fontWeight: FontWeight.w500),
      titlePadding: EdgeInsets.only(left: 24,top: 24, bottom: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
            bottom: Radius.circular(8)
          )
      ),
      children: [
        for (int item = 0; item < widget.listData.length; item++)
        SimpleDialogItem(
          text: widget.listData[item].toString(),
          onPressed: () {
            Navigator.pop(context,  widget.listData[item].toString());
          },
        ),
      ],
    );
  }

}






