import '../../../shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDialogGroupInfo extends StatefulWidget {

  final String title;
  final String groupTitle;
  final String groupStartDate;
  final String groupEndDate;
  final String groupTeacher;
  final String groupStudentsCount;
  final String groupPrice;
  final String groupCity;
  final String buttonTitle;
  final Function onPressed;

  const CustomDialogGroupInfo({Key key, this.title, @required this.groupTitle, this.groupStartDate, this.groupEndDate, this.groupTeacher, this.groupStudentsCount, this.groupPrice, this.groupCity, this.onPressed, this.buttonTitle, }) : super(key: key);

  _CustomDialogGroupInfo createState() => _CustomDialogGroupInfo();
}

class _CustomDialogGroupInfo extends State<CustomDialogGroupInfo> {


  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                style: TextStyle(
                    fontSize: 15,
                    color: ColorPalettes.textColorBlack,
                    fontFamily: 'Golos',
                    fontWeight: FontWeight.w500
                ),
              ),
              Container(
                transform: Matrix4
                    .translationValues(
                    4.0, -4.0, 0.0),
                child: InkWell(
                    child: SvgPicture.asset(IconAssets.closeIcon),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(widget.groupTitle,
            style: TextStyle(
                fontSize: 18,
                color: ColorPalettes.textColorBlack,
                fontFamily: 'Golos',
                fontWeight: FontWeight.w800
            ),
          ),
        ],
      ),
      titlePadding: EdgeInsets.only(left: 18,top: 18, bottom: 0,right: 18),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
              bottom: Radius.circular(8)
          )
      ),
      contentPadding: EdgeInsets.only(left: 18, bottom: 18, top: 5, right: 18),
      children: [
        SizedBox(height: 10),
        Divider(
          height: 0,
          thickness: 1,
          color: ColorPalettes.greyStroke,
          indent: 0,
          endIndent: 0,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(widget.groupStartDate,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontWeight: FontWeight.w400
              ),
            ),
            Text(' - ${widget.groupEndDate}',
              style: TextStyle(
                  height: 1.5,
                  fontSize: 15,
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
        Text(widget.groupTeacher,
          style: TextStyle(
              height: 1.5,
              fontSize: 15,
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w400
          ),
        ),
        Text('${widget.groupStudentsCount} ${AppLocalizations.of(context).translate('students2')}',
          style: TextStyle(
              height: 1.5,
              fontSize: 15,
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w400
          ),
        ),
        Text('${widget.groupPrice} ${AppLocalizations.of(context).translate('som')}',
          style: TextStyle(
              height: 1.5,
              fontSize: 15,
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(height: 5),
        Text('${AppLocalizations.of(context).translate('cityLetter')}${widget.groupCity}',
          style: TextStyle(
              height: 1.5,
              fontSize: 13,
              color: ColorPalettes.textColorGrey,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w400
          ),
        ),
        SizedBox(height: 10),
        Container(
            width: Sizes.width(context) * .9,
            child: RaisedButton(
              elevation: 0,
              color: ColorPalettes.white,
              onPressed: widget.onPressed,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: ColorPalettes.deepPurple,
                ),
                borderRadius: BorderRadius.circular(
                  Sizes.dp6(context),
                ),
              ),
              child: Text(
                widget.buttonTitle,
                style: TextStyle(
                  color: ColorPalettes.textColorGrey,
                  fontFamily: 'Golos_Regular',
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
            ))
      ],
    );
  }

}