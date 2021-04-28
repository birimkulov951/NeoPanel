import '../../../shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogCardItem extends StatelessWidget {
  const DialogCardItem({Key key, this.city, this.groupsInBranch, this.date, this.onPressed, })
      : super(key: key);

  final String city;
  final String groupsInBranch;
  final String date;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            transform: Matrix4.translationValues(0.0, -7.5, 0.0),
            child:  Padding(
              padding: const EdgeInsetsDirectional.only(start: 15, top: 7, bottom: 7, end: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context).translate('cityLetter:')}$city',
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: 'Golos',
                            color: ColorPalettes.textColorBlack,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: 'Golos',
                            color: ColorPalettes.textColorGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('groupsInBranch:'),
                            style: TextStyle(
                                height: 1.5,
                                fontFamily: 'Golos',
                                color: ColorPalettes.textColorGrey,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            groupsInBranch,
                            style: TextStyle(
                                height: 1.5,
                                fontFamily: 'Golos',
                                color: ColorPalettes.textColorBlack,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Container(
                        transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                        child:  IconButton(icon: SvgPicture.asset(
                            IconAssets.deleteIcon),
                            onPressed: onPressed
                      )
                      )
                    ],
                  ),
                ],
              )
          ),
          ),
        ],
      ),
    );
  }
}