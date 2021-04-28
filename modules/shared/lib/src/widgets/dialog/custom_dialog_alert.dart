import '../../../shared.dart';
import 'package:flutter/material.dart';

class CustomDialogAlert extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function onNegative;
  final Function onPositive;

  const CustomDialogAlert({
    Key key,
    this.title,
    @required this.subTitle,
    this.onNegative,
    this.onPositive,
  }) : super(key: key);

  _CustomDialogAlert createState() => _CustomDialogAlert();
}

class _CustomDialogAlert extends State<CustomDialogAlert> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.title == null ? false : true,
            child: Text(
              widget.title ?? '',
              style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            widget.subTitle,
            style: TextStyle(
                height: 1.5,
                fontSize: 15,
                color: ColorPalettes.textColorBlack,
                fontFamily: 'Golos',
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      titlePadding: EdgeInsets.only(left: 0, top: 24, bottom: 5, right: 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(8), bottom: Radius.circular(8))),
      children: [
        SizedBox(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              elevation: 0,
              color: ColorPalettes.deepPurple,
              onPressed: widget.onNegative,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  Sizes.dp6(context),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).translate('no'),
                style: TextStyle(
                  color: ColorPalettes.white,
                  fontFamily: 'Golos_Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            RaisedButton(
              elevation: 0,
              color: ColorPalettes.white,
              onPressed: widget.onPositive,
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
                AppLocalizations.of(context).translate('yes2'),
                style: TextStyle(
                  color: ColorPalettes.textColorGrey,
                  fontFamily: 'Golos_Regular',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            )
          ],
        )
      ],
    );
  }
}
