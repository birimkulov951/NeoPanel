import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/archive/archive_group_students_page.dart';
import 'package:neopanel/ui/notifications_page.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';



class ArchivePage extends StatefulWidget {
  static const routeName = "/archivePage";

  const ArchivePage({Key key}) : super(key: key);

  _ArchivePage createState() => _ArchivePage();
}

class _ArchivePage extends State<ArchivePage> {

  final List<String> names = <String>['Алиева', 'Алиева', 'Алиева', 'Алиева ', 'Алиева'];
  final List<String> phones = <String>['+996(700)700-707', '+996(700)700-707', '+996(700)700-707', '+996(700)700-707', '+996(700)700-707'];
  final List<String> emails = <String>['cms.neolabs@gmail.com', 'cms.neolabs@gmail.com', 'cms.neolabs@gmail.com', 'cms.neolabs@gmail.com', 'cms.neolabs@gmail.com'];

  List<TeacherItem> items = <TeacherItem>[
    TeacherItem(isExpanded: false, city: 'Bishkek', name: 'Nodir', surname: 'Nodirov', middleName: 'nodirovich', monday: '12:12',tuesday: '12:32', wednesday: '12:42', thursday: '12:43', friday: '56:78', saturday: '12:54', sunday: '45:09'),
    TeacherItem(isExpanded: false, city: 'Bishkek', name: 'Nodir', surname: 'Nodirov', middleName: 'nodirovich', monday: '12:12',tuesday: '12:32', wednesday: '12:42', thursday: '12:43', friday: '56:78', saturday: '12:54', sunday: '45:09'),
    TeacherItem(isExpanded: false, city: 'Bishkek', name: 'Nodir', surname: 'Nodirov', middleName: 'nodirovich', monday: '12:12',tuesday: '12:32', wednesday: '12:42', thursday: '12:43', friday: '56:78', saturday: '12:54', sunday: '45:09'),
    TeacherItem(isExpanded: false, city: 'Bishkek', name: 'Nodir', surname: 'Nodirov', middleName: 'nodirovich', monday: '12:12',tuesday: '12:32', wednesday: '12:42', thursday: '12:43', friday: '56:78', saturday: '12:54', sunday: '45:09'),
    TeacherItem(isExpanded: false, city: 'Bishkek', name: 'Nodir', surname: 'Nodirov', middleName: 'nodirovich', monday: '12:12',tuesday: '12:32', wednesday: '12:42', thursday: '12:43', friday: '56:78', saturday: '12:54', sunday: '45:09'),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar:  _getAppBar(context),
          body: TabBarView(
            children: [
              _getRequests(context),
              _getStudents(context),
              _getGroups(context),
              _getTeachers(context),
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
          AppLocalizations.of(context).translate('archive'),
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
          isScrollable: true,
          indicatorPadding: EdgeInsets.only(left: 8, right: 8),
          indicatorColor: ColorPalettes.lightPurple,
          labelColor: ColorPalettes.textColorBlack,
          unselectedLabelColor: ColorPalettes.textColorGrey,
          labelStyle: TextStyle(fontFamily: 'Golos', fontWeight: FontWeight.w500),  //For Selected tab
          unselectedLabelStyle: TextStyle(fontFamily: 'Golos'),
          tabs: [
            Tab(text:  AppLocalizations.of(context).translate('requests')),
            Tab(text:  AppLocalizations.of(context).translate('students')),
            Tab(text:  AppLocalizations.of(context).translate('groups')),
            Tab(text:  AppLocalizations.of(context).translate('teachers')),
            Tab(text:  AppLocalizations.of(context).translate('employees')),
          ]
      ),
    );
  }


  _getRequests(BuildContext context) {
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
                        side: BorderSide(width: 1, color: ColorPalettes.boardViewCardStroke)
                    ),
                    child:  InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        onTap: () {
                          CustomToast.showCustomToast(context, "Requests list index $index");
                        },
                        child: Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0,
                            top: 14.0,
                            right: 14.0,
                            bottom: 10.0
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
                                      AppLocalizations.of(context).translate('cityLetter'),
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      'Bishkek',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '04.04.21',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ' | 15:00',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
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
                            Container(
                                transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                child: Text(
                                  '+996 3443 543 54',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
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
                                            'Java',
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
                        ))
                    )
                  )
              ]
          ),
        )
    );
  }

  _getStudents(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child:  Column(
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
                        side: BorderSide(width: 1, color: ColorPalettes.boardViewCardStroke)),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      onTap: () {
                        CustomToast.showCustomToast(context, "Group list index $index");
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
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
                                        'Bishkek',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          '14.04.21',
                                          style: TextStyle(
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          ' | 15:00',
                                          style: TextStyle(
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).translate('teacherLetter:'),
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        height: 1.5,
                                        color: ColorPalettes.textColorBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'TeacherName',
                                    style: TextStyle(
                                        height: 1.5,
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.textColorBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                    child: Card(
                                      elevation: 0,
                                      color: Color(0xFFFDD835),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6)),
                                      child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                            'Java',
                                            style: TextStyle(
                                                fontFamily: 'Golos',
                                                color: ColorPalettes.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w800),
                                          )),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).translate('payment:'),
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Container(
                                        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                        child: SvgPicture.asset(IconAssets.successfulIcon),
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

  _getGroups(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child:  Column(
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
                        onTap: () {
                          Navigation.intentWithData(context, ArchiveGroupStudentsPage.routeName, {AppConstants.PAGE_NAME: names[index]});
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${AppLocalizations.of(context).translate('cityLetter')}Bishkek',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          height: 1.5,
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '17.04.21',
                                          style: TextStyle(
                                              color: ColorPalettes.textColorGrey,
                                              fontFamily: 'Golos',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          ' | 16.04.21',
                                          style: TextStyle(
                                              color: ColorPalettes.textColorGrey,
                                              fontFamily: 'Golos',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).translate('teacherLetter:'),
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          height: 1.5,
                                          color: ColorPalettes.textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      names[index].toString(),
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Container(
                                    transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                                    color: ColorPalettes.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.normal),
                                              )),
                                        ),
                                        Text(
                                          '  8500 ${AppLocalizations.of(context).translate('som')}',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    )
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).translate('students:'),
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          '12',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorBlack,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).translate('months:'),
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text(
                                          '3',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorBlack,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
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

  _getTeachers(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child:  Column(
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
                      onTap: () {
                        CustomToast.showCustomToast(context, "Group list index $index");
                      },
                      child:  Padding(
                          padding: const EdgeInsets.only(
                            left: 14.0,
                            right: 14.0,
                            top: 14.0,
                            bottom: 0.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child:  CircleAvatar(
                                            minRadius: 35,
                                            backgroundColor: ColorPalettes.iconGreen,
                                            child: Text(
                                              items[index].name[0],
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
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.normal),
                                                  ),
                                                  Text(
                                                    items[index].city,
                                                    style: TextStyle(
                                                        height: 1.5,
                                                        color: ColorPalettes.textColorGrey,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    items[index].surname,
                                                    style: TextStyle(
                                                        height: 1.5,
                                                        fontFamily: 'Golos',
                                                        color: ColorPalettes.textColorBlack,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w800),
                                                  ),
                                                  Text(
                                                    items[index].name,
                                                    style: TextStyle(
                                                        height: 1.5,
                                                        fontFamily: 'Golos',
                                                        color: ColorPalettes.textColorBlack,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w800),
                                                  ),
                                                  Text(
                                                    items[index].middleName,
                                                    style: TextStyle(
                                                        height: 1.5,
                                                        fontFamily: 'Golos',
                                                        color: ColorPalettes.textColorBlack,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w800),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                  transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context).translate('schedule'),
                                        style: TextStyle(
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                                        child:  IconButton(icon: SvgPicture.asset(
                                            items[index].isExpanded == true ? IconAssets.dropUpIconPurple : IconAssets.dropDownIconPurple),
                                            onPressed: () {
                                              setState(() {
                                                items[index].isExpanded = !items[index].isExpanded;
                                              });
                                            }),
                                      )
                                    ],
                                  )),
                              Container(
                                transform: Matrix4.translationValues(0.0, -14.0, 0.0),
                                child: Visibility(
                                    visible: items[index].isExpanded,
                                    maintainState: true,
                                    maintainAnimation: true,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).translate('mn:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              items[index].monday,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).translate('tu:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              items[index].tuesday,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).translate('wd:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              items[index].wednesday,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).translate('th:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              items[index].thursday,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).translate('fr:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              items[index].friday,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).translate('st:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              items[index].saturday,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).translate('sn:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              items[index].sunday,
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes.textColorGrey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                ),)

                            ],
                          )
                      ),
                    )
                  ),
              ]
          ),
        )
    );
  }

  _getEmployees(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          child:  Column(
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
                                bottom: 7.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                            minRadius: 35,
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
                                                          color: ColorPalettes.textColorGrey,
                                                          fontFamily: 'Golos',
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.normal),
                                                    ),
                                                    Text(
                                                      'Bishkek',
                                                      style: TextStyle(
                                                          height: 1.5,
                                                          color: ColorPalettes.textColorGrey,
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
                                  SizedBox(height: 5),
                                  Text(
                                    '${phones[index]}',
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.textColorBlue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '${emails[index]}',
                                    style: TextStyle(
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
                                  icon: SvgPicture.asset(IconAssets.restoreIcon),
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
                    ),
                  )
              ]
          ),
        )
    );
  }

}

