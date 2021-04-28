import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/forms/group_form_page.dart';
import 'package:neopanel/ui/notifications_page.dart';
import 'package:neopanel/ui/settings/cities_settings_page.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = "/settingsPage";

  const SettingsPage({Key key}) : super(key: key);

  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {

  String deleteBranchId;


  final List<CourseGroupList> courseGroupList = [];


  @override
  void initState() {
    context.read<GroupBloc>().add(GetGroups());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        print('State is $state');
        if (state is CoursesAndGroupsHasData) {

          courseGroupList.clear();
          for(int tabs = 0; tabs < state.coursesResult.results.length; tabs++) {
            CourseGroupList course = CourseGroupList(courseName: state.coursesResult.results[tabs].name);

            print(state.coursesResult.results[tabs].name);
            for(int groups = 0; groups < state.groupsResult.results.length; groups++) {
              if (state.groupsResult.results[groups].course.contains(course.courseName)) {
                GroupItem group = GroupItem(id: state.groupsResult.results[groups].id, name: state.groupsResult.results[groups].name, cityName: state.groupsResult.results[groups].cityName, months: state.groupsResult.results[groups].months, course: state.groupsResult.results[groups].course,);
                course.groups.add(group);
              }
            }
            courseGroupList.add(course);
          }

          return DefaultTabController(
            length: courseGroupList.length,
            child: Scaffold(
                appBar: AppBar(
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
                    AppLocalizations.of(context).translate('settings'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontWeight: FontWeight.w500),
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: SvgPicture.asset(IconAssets.additionalSettingsIcon),
                        onPressed: () {
                          CustomToast.showCustomToast(context, 'Additional settings icon');
                        }),
                    IconButton(
                        icon: SvgPicture.asset(IconAssets.cityIconBlack),
                        onPressed: () {
                          Navigation.intent(context, CitiesSettingsPage.routeName);
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
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.only(left: 8, right: 8),
                      indicatorColor: ColorPalettes.lightPurple,
                      labelColor: ColorPalettes.textColorBlack,
                      unselectedLabelColor: ColorPalettes.textColorGrey,
                      labelStyle: TextStyle(fontFamily: 'Golos', fontWeight: FontWeight.w500),  //For Selected tab
                      unselectedLabelStyle: TextStyle(fontFamily: 'Golos'),
                      tabs: [
                        for(int i = 0; i < courseGroupList.length; i++)
                          Tab(text: courseGroupList[i].courseName.toString()),
                      ]
                  ),
                ),
                body: TabBarView(
                  children: [
                    for(int i = 0; i < courseGroupList.length; i++)
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          reverse: false,
                          itemCount: courseGroupList[i].groups.length + 1,
                          itemBuilder: (context, index) {
                            if (index != courseGroupList[i].groups.length) {
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
                                      side: BorderSide(width: 1, color: ColorPalettes.purpleGreyStroke)),
                                  child: InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(14)),
                                    onTap: () {

                                      CustomToast.showCustomToast(context, "Group list index $index");
                                     /* Navigation.intentWithData(context, GroupFormPage.routeName, {
                                        AppConstants.CLIENT_ID: courseGroupList[i].groups[index].id,
                                        AppConstants.CLIENT_NAME: courseGroupList[i].groups[index].name,
                                        AppConstants.CLIENT_CITY: courseGroupList[i].groups[index].cityName,
                                        AppConstants.CLIENT_MONTHS: courseGroupList[i].groups[index].months,
                                        AppConstants.CLIENT_COURSE: courseGroupList[i].groups[index].course,
                                      });*/
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
                                                  '${AppLocalizations.of(context).translate('cityLetter')}${courseGroupList[i].groups[index].cityName??''}',
                                                  style: TextStyle(
                                                      fontFamily: 'Golos',
                                                      height: 1.5,
                                                      color: ColorPalettes.textColorGrey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.normal),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '15.04.21',
                                                      style: TextStyle(
                                                          color: ColorPalettes.textColorGrey,
                                                          fontFamily: 'Golos',
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                    Text(
                                                      ' | 00:00',
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
                                                            '${courseGroupList[i].groups[index].course??''}',
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
                                                      '${courseGroupList[i].groups[index].months??'xx'}',
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
                              );
                            } else {
                              return Container(
                                  padding: EdgeInsets.only(top: 7, bottom: 14, left: 18, right: 18),
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
                                            height: 130,
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
                                        Navigation.intent(context, GroupFormPage.routeName);
                                        },
                                    ),
                                  )
                              );
                            }
                          },
                        ),
                      )
                  ],
                )
            ),
          );

        }  else if (state is CoursesNoData) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: SingleChildScrollView(
                  child: CustomErrorWidget(
                    message: AppLocalizations.of(context).translate('noDataAvailable'),
                  )
              )
          );
        }
        else if (state is GroupsNoData) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: CustomErrorWidget(
                message: AppLocalizations.of(context).translate('noDataAvailable'),
              )
          );
        }
        else if (state is TeacherNoInternetConnection) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: NoInternetWidget(message: AppLocalizations.of(context).translate('noInternetConnection'),)
          );
        }
        else if (state is GroupError) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: CustomErrorWidget(message: AppLocalizations.of(context).translate('unknownError'),)
          );
        }else if (state is GroupLoading) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CoursesTabShimmer(48),
                    ListShimmer(153)
                  ],
                )
              )
          );
        } else {
          return Scaffold(
              appBar: _getAppBar(context),
              body: Center(
                child: Text(AppLocalizations.of(context).translate('unknownError'))
              )
          );
        }
      },
    );
  }


 /* @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: groupTypes.length,
        child: Scaffold(
            appBar: _getAppBar(context),
            body: TabBarView(
              children: [
                for(int i = 0; i < groupTypes.length; i++)
                  _getGroups(context)
              ],
            )
        ));
  }*/

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
          AppLocalizations.of(context).translate('settings'),
          style: TextStyle(
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(IconAssets.additionalSettingsIcon),
            onPressed: () {
              CustomToast.showCustomToast(context, 'Additional settings icon');
            }),
        IconButton(
            icon: SvgPicture.asset(IconAssets.cityIconBlack),
            onPressed: () {
              Navigation.intent(context, CitiesSettingsPage.routeName);
            }),
        IconButton(
            icon: SvgPicture.asset(IconAssets.notificationsIconBlack),
            onPressed: () {
              Navigation.intentWithData(context, NotificationsPage.routeName, {
                AppConstants.IS_APPBAR_ALLOWED: true,
              });
            }),
      ],
     /* bottom: TabBar(
          isScrollable: true,
          indicatorPadding: EdgeInsets.only(left: 8, right: 8),
          indicatorColor: ColorPalettes.lightPurple,
          labelColor: ColorPalettes.textColorBlack,
          unselectedLabelColor: ColorPalettes.textColorGrey,
          labelStyle: TextStyle(fontFamily: 'Golos'),  //For Selected tab
          unselectedLabelStyle: TextStyle(fontFamily: 'Golos'),
          tabs: [
            for(int i = 0; i < groupTypes.length; i++)
              Tab(
              text: groupTypes[i],
            )
          ]
      ),*/
    );
  }

  /*_getGroups(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                  Text(
                                    '${AppLocalizations.of(context).translate('cityLetter')}#City#',
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        height: 1.5,
                                        color: ColorPalettes.textColorGrey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '#date#',
                                        style: TextStyle(
                                            color: ColorPalettes.textColorGrey,
                                            fontFamily: 'Golos',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        ' | #hours#',
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
                                              '#course#',
                                              style: TextStyle(
                                                  color: ColorPalettes.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal),
                                            )),
                                      ),
                                      Text(
                                        '  #price# ${AppLocalizations.of(context).translate('som')}',
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
                                        'xx',
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
                                        'xx',
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
                  ),
                *//*Padding(
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
                              height: 135,
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
                          CustomToast.showCustomToast(context, 'Hellooooo!!');
                        },
                      ),
                    )
                )*//*
              ]
          ),
    );
  }*/

}
