import 'package:shared/shared.dart';

import 'package:neopanel/ui/leads/client_card_page.dart';
import 'package:neopanel/ui/notifications_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class WaitingListPage extends StatefulWidget {
  static const routeName = "/waitingListPage";

  const WaitingListPage({Key key}) : super(key: key);

  _WaitingListPage createState() => _WaitingListPage();
}

class _WaitingListPage extends State<WaitingListPage> {

  final List<String> names = <String>['Алиева', 'Алиева', 'Алиева', 'Алиева ', 'Алиева'];
  final List<String> phones = <String>['+996(700)700-707', '+996(700)700-707', '+996(700)700-707', '+996(700)700-707', '+996(700)700-707'];
  final List<String> emails = <String>['cms.neolabs@gmail.com', 'cms.neolabs@gmail.com', 'cms.neolabs@gmail.com', 'cms.neolabs@gmail.com', 'cms.neolabs@gmail.com'];


  final tabs = [
    'Java',
    'Swift',
    'JavaScript',
    'PHP',
    'UI/IX',
    'PM',
    'Tab 7',
    'Tab 8',
    'Tab 9',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar:  _getAppBar(context),
          body: TabBarView(
            children: [
              _getWaitingList(context),
              _getWaitingList(context)
            ],
          )
      ),

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
          AppLocalizations.of(context).translate('waitingList2'),
          style: TextStyle(
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(IconAssets.notificationsIconBlack),
            onPressed: () {
              Navigation.intentWithData(context, NotificationsPage.routeName, {
                AppConstants.IS_APPBAR_ALLOWED: true,
              });
            }),
      ],
      bottom: TabBar(
          indicatorPadding: EdgeInsets.only(left: 8, right: 8),
          indicatorColor: ColorPalettes.lightPurple,
          labelColor: ColorPalettes.textColorBlack,
          unselectedLabelColor: ColorPalettes.textColorGrey,
          labelStyle: TextStyle(fontFamily: 'Golos', fontWeight: FontWeight.w500),  //For Selected tab
          unselectedLabelStyle: TextStyle(fontFamily: 'Golos'),
          tabs: [
            Tab(
              text: AppLocalizations.of(context).translate('requests'),
            ),
            Tab(
              text: AppLocalizations.of(context).translate('exStudents'),
            ),
          ]
      ),
    );
  }

  _getWaitingList(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                for (int index = 0; index < names.length; index++)
                  Card(
                    margin: EdgeInsets.only(
                      left: 14.0,
                      right: 14.0,
                      top: 7.0,
                      bottom: 7.0,
                    ),
                    elevation: 0,
                    color: ColorPalettes.white,
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
                        child: Stack(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14.0,
                                      top: 14.0,
                                      right: 14.0,
                                      bottom: 14.0
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${AppLocalizations.of(context).translate('cityLetter')}Бишкек' ,
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
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Visibility(visible: true,child: SvgPicture.asset(IconAssets.alertIcon)),
                                              Text(
                                                '22.04.21 | 12:00',
                                                style: TextStyle(
                                                    fontFamily: 'Golos',
                                                    color: ColorPalettes.textColorGrey,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400),
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                      Text(
                                        names[index],
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        '+996 709 586 483',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                          transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Card(
                                                elevation: 0,
                                                // todo this is adjustable color
                                                color: Color(0xFFFDD835),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(6)),
                                                child: Padding(
                                                    padding: const EdgeInsets.all(6.0),
                                                    child: Text(
                                                      'Python',
                                                      style: TextStyle(
                                                          fontFamily: 'Golos',
                                                          color: ColorPalettes.white,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w400),
                                                    )),
                                              ),
                                              Card(
                                                elevation: 0,
                                                color: Color(0xFF787885),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(6)),
                                                child: Padding(
                                                    padding: const EdgeInsets.all(6.0),
                                                    child: Text(
                                                      '#source#',
                                                      style: TextStyle(
                                                          fontFamily: 'Golos',
                                                          color: ColorPalettes.white,
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w400),
                                                    )),
                                              )
                                            ],
                                          ))
                                    ],
                                  )),
                              Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: IconButton(
                                      icon: SvgPicture.asset(IconAssets.deleteIcon),
                                      onPressed: () {
                                        showDialog(context: context, builder: (context) =>
                                            CustomDialogAlert(
                                                subTitle: AppLocalizations.of(context).translate('timeToRestore'),
                                                onNegative: () {
                                                  Navigator.pop(context);
                                                },
                                                onPositive: () {
                                                  CustomToast.showCustomToast(context, 'Positive clicked');
                                                }));
                                      }
                                  ))
                            ],
                        )
                    )
                  )
              ]
          ),
        )
    );
  }

}

