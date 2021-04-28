import '../../../shared.dart';
import 'package:flutter/material.dart';

class CustomDialogNotification extends StatefulWidget {

  final String title;
  final String subTitle;
  final Function onPressed;

  const CustomDialogNotification({Key key, this.title, @required this.subTitle, this.onPressed}) : super(key: key);

  _CustomDialogNotification createState() => _CustomDialogNotification();
}

class _CustomDialogNotification extends State<CustomDialogNotification> {

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.title == null ? false : true,
            child: Text(widget.title??'',
              style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontWeight: FontWeight.w800
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,top: 0, bottom: 0,right: 15),
            child: Text(widget.subTitle,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            )
          )
        ],
      ),
      titlePadding: EdgeInsets.only(left: 0,top: 24, bottom: 5,right: 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
              bottom: Radius.circular(8)
          )
      ),
      children: [
        SizedBox(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              elevation: 0,
              color: ColorPalettes.deepPurple,
              onPressed: widget.onPressed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Sizes.dp6(context),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).translate('ok'),
                style: TextStyle(
                  color:ColorPalettes.white,
                  fontFamily: 'Golos_Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ],
        )
      ],
    );
  }

}






