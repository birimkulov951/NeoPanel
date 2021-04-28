import 'package:shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsPage extends StatefulWidget {
  static const routeName = "/notificationsPage";

  const NotificationsPage({Key key}) : super(key: key);

  _NotificationsPage createState() => _NotificationsPage();
}

class _NotificationsPage extends State<NotificationsPage> {
  final List<String> notifications = <String>[
    'Таалайбек улуу Бекболот',
    'Таалайбек улуу Бекболот',
    'Таалайбек улуу Бекболот',
    'Таалайбек улуу Бекболот',
    'Таалайбек улуу Бекболот'
  ];

  bool isAppbarAllowed = false;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      print(arguments[AppConstants.IS_APPBAR_ALLOWED]);
      if (arguments[AppConstants.IS_APPBAR_ALLOWED] == true) {
        isAppbarAllowed = true;
      } else {
        isAppbarAllowed = false;
      }
    }
    return Scaffold(
        appBar: isAppbarAllowed ? _getAppBar(context) : null,
        body: _getNotifications(context));
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
        AppLocalizations.of(context).translate('notifications'),
        style: TextStyle(
            color: ColorPalettes.textColorBlack,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w500),
      ),
      centerTitle: false,
      actions: [
        IconButton(
            icon: SvgPicture.asset(IconAssets.notificationsIconGreen),
            onPressed: null)
      ]);
  }

  _getNotifications(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: false,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          if (notifications[index].isEmpty) {
            return Container(
              width: Sizes.width(context) * .9,
              child: Text(
                // todo show here a days not card
                notifications[index].toString(),
                style: TextStyle(
                    color: ColorPalettes.textColorBlack,
                    fontFamily: 'Golos',
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              ),
            );
          } else {
            return Card(
              margin: EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                top: 7.0,
                bottom: 7.0,
              ),
              elevation: 0,
              color: ColorPalettes.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                      width: 1, color: ColorPalettes.boardViewCardStroke)),
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
                      Text(
                        '${notifications[index]}',
                        style: TextStyle(
                            height: 1.5,
                            color: ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Как работают уведомления. По умолчанию оповещения от веб-сайтов, приложений и расширений появляются в Chrome только после вашего разрешения',
                        style: TextStyle(
                            height: 1.5,
                            color: ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '21.04.21',
                            style: TextStyle(
                                height: 1.5,
                                color: ColorPalettes.textColorGrey,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '  08:00',
                            style: TextStyle(
                                height: 1.5,
                                color: ColorPalettes.textColorGrey,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  )),
            );
          }
        });
  }
}
