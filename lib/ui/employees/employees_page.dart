import 'package:shared/shared.dart';

import 'package:neopanel/ui/employees/employee_form_page.dart';
import 'package:neopanel/ui/notifications_page.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class EmployeesPage extends StatefulWidget {
  static const routeName = "/employeesPage";

  const EmployeesPage({Key key}) : super(key: key);

  _EmployeesPage createState() => _EmployeesPage();
}

class _EmployeesPage extends State<EmployeesPage> {

  String switchedRole;
  final List<String> roles = <String>['super Admin','admin','SmmAgent'];

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
      length: 3,
      child: Scaffold(
          appBar:  _getAppBar(context),
          body: TabBarView(
            children: [
              _getEmployees(context),
              _getEmployees(context),
              _getEmployees(context)
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
          AppLocalizations.of(context).translate('employees2'),
          style: TextStyle(
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(IconAssets.additionalSettingsIcon),
            onPressed: () async {
            }),
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
          unselectedLabelStyle: TextStyle(fontFamily: 'Golos'), tabs: [
            Tab(
              text: AppLocalizations.of(context).translate('superAdmin'),
            ),
            Tab(
              text: AppLocalizations.of(context).translate('admin'),
            ),
            Tab(
              text: AppLocalizations.of(context).translate('smmAgent'),
            ),
          ]
      ),
    );
  }

  _getEmployees(BuildContext context) {
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
                    color: ColorPalettes.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(width: 1, color: ColorPalettes.purpleGreyStroke)),
                    child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        onTap:  () {
                          CustomToast.showCustomToast(context, 'employees index $index');
                        },
                        child: Stack(
                          children: [
                            Padding(
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: CircleAvatar(
                                              minRadius: 40,
                                              backgroundColor: ColorPalettes.iconGreen,
                                              child: Text(
                                                'A',
                                                style: TextStyle(
                                                    fontFamily: 'Golos',
                                                    color: ColorPalettes.white,
                                                    fontSize: 36,
                                                    fontWeight: FontWeight.w500),
                                              )
                                          )
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child:  Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(context).translate('cityLetter'),
                                                        style: TextStyle(
                                                            height: 1.5,
                                                            fontFamily: 'Golos',
                                                            color: ColorPalettes.textColorGrey,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.normal),
                                                      ),
                                                      Text(
                                                        'Bishkek',
                                                        style: TextStyle(
                                                            height: 1.5,
                                                            color: ColorPalettes.textColorGrey,
                                                            fontFamily: 'Golos',
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.normal),
                                                      ),
                                                    ]
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
                                                  'Алия',
                                                  style: TextStyle(
                                                      height: 1.5,
                                                      fontFamily: 'Golos',
                                                      color: ColorPalettes.textColorBlack,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w800),
                                                ),
                                                Text(
                                                  'Алиевна',
                                                  style: TextStyle(
                                                      height: 1.5,
                                                      fontFamily: 'Golos',
                                                      color: ColorPalettes.textColorBlack,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w800),
                                                ),
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                    Text(
                                      '${phones[index]}',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorBlue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${emails[index]}',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )),
                            Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                    icon: SvgPicture.asset(IconAssets.deleteIcon),
                                    onPressed: () {}
                                ))
                          ],
                        )
                    ),
                  ),
                Padding(
                    padding: EdgeInsets.only(top: 7, bottom: 14),
                    child: Material(
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        child: DottedBorder(
                          dashPattern: [5, 5, 5, 5],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(14),
                          color: ColorPalettes.purpleGreyStroke,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            child: Container(
                              height: 150,
                              width: Sizes.width(context) * .88,
                              child: Center(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          border: Border.all(width: 1, color: ColorPalettes.greyStroke)),
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: SvgPicture.asset(IconAssets.addIconWhite)
                                      )
                                  )
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigation.intent(context, EmployeeFormPage.routeName);
                        },
                      ),
                    )
                )
              ]
          ),
        )
    );
  }

}
