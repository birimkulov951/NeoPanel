import '../../../shared.dart';
import 'package:flutter/material.dart';

class CustomDialogSwitchRole extends StatefulWidget {

  final String title;
  final List<String> roles;
  final Function onPressed;

  const CustomDialogSwitchRole({Key key, @required this.title, this.onPressed, this.roles}) : super(key: key);

  _CustomDialogSwitchRole createState() => _CustomDialogSwitchRole();
}

class _CustomDialogSwitchRole extends State<CustomDialogSwitchRole> {

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
        for (int item = 0; item < widget.roles.length; item++)
          SimpleDialogItem(
            text: widget.roles[item].toString(),
            onPressed: () {
              Navigator.pop(context,  widget.roles[item].toString());
            },
          ),
        SizedBox(height: 20),
        Container(
            width: Sizes.width(context) * .9,
            child: RaisedButton(
              color: ColorPalettes.white,
              onPressed: widget.onPressed,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: ColorPalettes.greyButton,
                ),
                borderRadius: BorderRadius.circular(
                  Sizes.dp6(context),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).translate('toArchive'),
                style: TextStyle(
                  color:ColorPalettes.textColorGrey,
                  fontFamily: 'Golos_Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
            ))
      ],
    );
  }

}






