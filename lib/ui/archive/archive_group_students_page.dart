
import 'package:neopanel/ui/leads/client_card_page.dart';
import 'package:neopanel/ui/notifications_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared/shared.dart';


class ArchiveGroupStudentsPage extends StatefulWidget {
  static const routeName = "/archiveGroupStudentsPage";

  const ArchiveGroupStudentsPage({Key key}) : super(key: key);

  _ArchiveGroupStudentsPage createState() => _ArchiveGroupStudentsPage();
}

class _ArchiveGroupStudentsPage extends State<ArchiveGroupStudentsPage> {

  String _displayingPageTitle = '';

  final List<String> names = <String>['Алия', 'Алиева Алия Алиевна', 'Алиева Алия Алиевна', 'Алиева Алия Алиевна', 'Алиева Алия Алиевна'];

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      print(arguments[AppConstants.PAGE_NAME]);
      _displayingPageTitle = arguments[AppConstants.PAGE_NAME];
    } else {
      _displayingPageTitle = 'Arguments error';
    }
    return Scaffold(
      appBar: _getAppBar(context),
      body:  _getStudentsByGroups(context, _displayingPageTitle)
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: ColorPalettes.white,
      brightness: Brightness.light,
      leading: IconButton(
          icon: SvgPicture.asset(IconAssets.backIcon),
          onPressed: () {
            Navigator.pop(context);
          }),
      titleSpacing: 0.0,
      title: Text(
        _displayingPageTitle,
        style: TextStyle(
            color: ColorPalettes.textColorBlack,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(IconAssets.detailsIconBlack),
            onPressed: () {
              showDialog(context: context, builder: (context) => CustomDialogGroupInfo(
                title: AppLocalizations.of(context).translate('groupInfo'),
                groupTitle: names[0],
                groupStartDate: names[0],
                groupEndDate: names[0],
                groupTeacher: names[0],
                groupStudentsCount: names[0],
                groupPrice: names[0],
                groupCity: names[0],
                buttonTitle: AppLocalizations.of(context).translate('unarchive'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ));
            }),
        IconButton(
            icon: SvgPicture.asset(IconAssets.notificationsIconBlack),
            onPressed: () {
              Navigation.intentWithData(context, NotificationsPage.routeName, {
                AppConstants.IS_APPBAR_ALLOWED: true,
              });
            }),
      ],
    );
  }

  _getStudentsByGroups(BuildContext context, String returnedGroup) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                for (int index = 0; index < names.length; index++)
                  Card(
                      margin: EdgeInsets.only(
                        left: 18.0,
                        right: 18.0,
                        top: 7.0,
                        bottom: 7.0,
                      ),
                      elevation: 0,
                      color:  Color(0xFFF2F2F2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(width: 1, color: ColorPalettes.boardViewCardStroke)),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        onTap: () {
                          //CustomToast.showCustomToast(context, "Open Card index ${listData[listIndex].items[itemIndex].name}");
                          Navigation.intentWithData(context, ClientCardPage.routeName, {
                            AppConstants.CARD_DATA: AppConstants.studentPage,
                            //AppConstants.CLIENT_ID: listData[listIndex].items[itemIndex].id,
                            AppConstants.CLIENT_NAME: names[index],
                            //AppConstants.CLIENT_PHONE: listData[listIndex].items[itemIndex].phone,
                            //AppConstants.CLIENT_COURSE: listData[listIndex].items[itemIndex].course,
                            //AppConstants.CLIENT_SOURCE: listData[listIndex].items[itemIndex].source,
                            //AppConstants.CLIENT_CITY: listData[listIndex].items[itemIndex].city,
                            //AppConstants.CLIENT_HAS_LAPTOP: listData[listIndex].items[itemIndex].id
                          });
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 14.0,
                              right: 14.0,
                              top: 14.0,
                              bottom: 14.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).translate('cityLetter'),
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      '#City#',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          height: 1.5,
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Container(
                                    transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                    child: Text(
                                      '${names[index]}',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    )
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '#studentPhone#',
                                  style: TextStyle(
                                      fontFamily: 'Golos',
                                      height: 1.5,
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${AppLocalizations.of(context).translate('laptop')}:',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorBlack,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Container(
                                          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                          child: SvgPicture.asset(IconAssets.successfulIcon),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).translate('payment:'),
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorBlack,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Container(
                                          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                          child: SvgPicture.asset(IconAssets.successfulIcon),
                                        ),
                                        Visibility(
                                            visible: true,
                                            child: Container(
                                              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(IconAssets.successfulIcon),
                                            )
                                        ),
                                        Visibility(
                                            visible: true,
                                            child: Container(
                                              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(IconAssets.minusIcon),
                                            )
                                        ),
                                        Visibility(
                                            visible: true,
                                            child: Container(
                                              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(IconAssets.unsuccessfulIcon),
                                            )
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
                      )
                  )
              ]
          ),
        )
    );
  }


}
