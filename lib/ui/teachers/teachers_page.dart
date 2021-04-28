import 'dart:core';

import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/notifications_page.dart';
import 'package:neopanel/ui/teachers/teacher_card_page.dart';
import 'package:neopanel/ui/teachers/teacher_form_page.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TeachersPage extends StatefulWidget {
  static const routeName = "/teachersPage";

  const TeachersPage({Key key}) : super(key: key);

  _TeachersPage createState() => _TeachersPage();
}

class _TeachersPage extends State<TeachersPage> {

  List<CourseTeacherList> courseTeacherList = [];


  @override
  void initState() {
    context.read<TeacherBloc>().add(GetTeachers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherBloc, TeacherState>(
      builder: (context, state) {
        print('State is $state');
        if (state is CoursesAndTeacherHasData) {

          try{
            courseTeacherList.clear();
            for(int tabs = 0; tabs < state.coursesResult.results.length; tabs++) {
              CourseTeacherList course = CourseTeacherList(courseName: state.coursesResult.results[tabs].name);

              for(int teachers = 0; teachers < state.teachersResult.results.length; teachers++) {
                if (state.teachersResult.results[teachers].course.contains(course.courseName)) {
                  TeacherItem group = TeacherItem(
                    isExpanded: false,
                    id: state.teachersResult.results[teachers].id,
                    name: state.teachersResult.results[teachers].name,
                    surname: state.teachersResult.results[teachers].surname,
                    middleName: state.teachersResult.results[teachers].middleName,
                    course: state.teachersResult.results[teachers].course,
                    //headerCity: state.teachersResult.results[i].city,
                    //monday: state.teachersResult.results[i].name,
                    //tuesday: state.teachersResult.results[i].name,
                    //wednesday: state.teachersResult.results[i].name,
                    //thursday: state.teachersResult.results[i].name,
                    //friday: state.teachersResult.results[i].name,
                    //saturday: state.teachersResult.results[i].name,
                  );
                  course.teachers.add(group);
                }
              }
              courseTeacherList.add(course);
            }
          } catch (_) {
            return Scaffold(
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
                    AppLocalizations.of(context).translate('teachers2'),
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
                ),
                body: CustomErrorWidget(message: AppLocalizations.of(context).translate('unknownError'),)
            );
          }


          return DefaultTabController(
            length: courseTeacherList.length,
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
                    AppLocalizations.of(context).translate('teachers2'),
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
                        for(int i = 0; i < courseTeacherList.length; i++)
                          Tab(text: courseTeacherList[i].courseName.toString()),
                      ]
                  ),
                ),
                body: TabBarView(
                  children: [
                    for(int i = 0; i < courseTeacherList.length; i++)
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          reverse: false,
                          itemCount: courseTeacherList[i].teachers.length + 1,
                          itemBuilder: (context, index) {
                            if (index != courseTeacherList[i].teachers.length) {
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
                                      side: BorderSide(width: 1, color: ColorPalettes.boardViewCardStroke)),
                                  child: InkWell(
                                    borderRadius: BorderRadius.all(Radius.circular(14)),
                                    onTap: () {
                                      Navigation.intentWithData(context, TeacherCardPage.routeName, {
                                        AppConstants.CLIENT_ID: courseTeacherList[i].teachers[index].id,
                                        AppConstants.CLIENT_SURNAME: courseTeacherList[i].teachers[index].surname,
                                        AppConstants.CLIENT_NAME: courseTeacherList[i].teachers[index].name,
                                        AppConstants.CLIENT_MIDDLE_NAME: courseTeacherList[i].teachers[index].middleName,
                                        AppConstants.CLIENT_COURSE: courseTeacherList[i].teachers[index].course,
                                      });
                                    },
                                    child: Padding(
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
                                                        child: CircleAvatar(
                                                            minRadius: 40,
                                                            backgroundColor: ColorPalettes.iconGreen,
                                                            child: Text(
                                                              courseTeacherList[i].teachers[index].name[0],
                                                              style: TextStyle(
                                                                  height: 1.5,
                                                                  fontFamily: 'Golos',
                                                                  color: ColorPalettes.white,
                                                                  fontSize: 36,
                                                                  fontWeight: FontWeight.w500),
                                                            )
                                                        )
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 12),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  '${AppLocalizations.of(context).translate('cityLetter')}Бишкек${courseTeacherList[i].teachers[index].city??AppLocalizations.of(context).translate('notIndicated')}',
                                                                  style: TextStyle(
                                                                      height: 1.5,
                                                                      fontFamily: 'Golos',
                                                                      color: ColorPalettes.textColorGrey,
                                                                      fontSize: 13,
                                                                      fontWeight: FontWeight.normal),
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  courseTeacherList[i].teachers[index].surname,
                                                                  style: TextStyle(
                                                                      height: 1.5,
                                                                      fontFamily: 'Golos',
                                                                      color: ColorPalettes.textColorBlack,
                                                                      fontSize: 15,
                                                                      fontWeight: FontWeight.w800),
                                                                ),
                                                                Text(
                                                                  courseTeacherList[i].teachers[index].name,
                                                                  style: TextStyle(
                                                                      height: 1.5,
                                                                      fontFamily: 'Golos',
                                                                      color: ColorPalettes.textColorBlack,
                                                                      fontSize: 15,
                                                                      fontWeight: FontWeight.w800),
                                                                ),
                                                                Text(
                                                                  courseTeacherList[i].teachers[index].middleName,
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
                                                          height: 1.5,
                                                          fontFamily: 'Golos',
                                                          color: ColorPalettes.textColorGrey,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                    /*InkWell(
                                                      child: SvgPicture.asset(courseTeacherList[i].teachers[index].isExpanded == true ? IconAssets.dropUpIconPurple : IconAssets.dropDownIconPurple),
                                                      onTap: () {
                                                        setState(() {
                                                          courseTeacherList[i].teachers[index].isExpanded = !courseTeacherList[i].teachers[index].isExpanded;
                                                        });
                                                      },
                                                    ),*/
                                                    Container(
                                                      transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                                                      child: IconButton(icon: SvgPicture.asset(courseTeacherList[i].teachers[index].isExpanded == true ? IconAssets.dropUpIconPurple : IconAssets.dropDownIconPurple),
                                                          onPressed: () {
                                                        print(courseTeacherList[i].teachers[index].isExpanded);
                                                            setState(() {
                                                              courseTeacherList[i].teachers[index].isExpanded = !courseTeacherList[i].teachers[index].isExpanded;
                                                            });
                                                          }),
                                                    )
                                                  ],
                                                )),
                                            Container(
                                              transform: Matrix4.translationValues(0.0, -14.0, 0.0),
                                              child: Visibility(
                                                  visible: courseTeacherList[i].teachers[index].isExpanded,
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
                                                            courseTeacherList[i].teachers[index].monday == '' || courseTeacherList[i].teachers[index].monday == null ? AppLocalizations.of(context).translate('dayOff') : courseTeacherList[i].teachers[index].monday,
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
                                                            courseTeacherList[i].teachers[index].tuesday == '' || courseTeacherList[i].teachers[index].tuesday == null ? AppLocalizations.of(context).translate('dayOff') : courseTeacherList[i].teachers[index].tuesday,
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
                                                            courseTeacherList[i].teachers[index].wednesday == '' || courseTeacherList[i].teachers[index].wednesday == null ? AppLocalizations.of(context).translate('dayOff') : courseTeacherList[i].teachers[index].wednesday,
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
                                                            courseTeacherList[i].teachers[index].thursday == '' || courseTeacherList[i].teachers[index].thursday == null ? AppLocalizations.of(context).translate('dayOff') : courseTeacherList[i].teachers[index].thursday,
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
                                                            courseTeacherList[i].teachers[index].friday == '' || courseTeacherList[i].teachers[index].friday == null ? AppLocalizations.of(context).translate('dayOff') : courseTeacherList[i].teachers[index].friday,
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
                                                            courseTeacherList[i].teachers[index].saturday == '' || courseTeacherList[i].teachers[index].saturday == null ? AppLocalizations.of(context).translate('dayOff') : courseTeacherList[i].teachers[index].saturday,
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
                                                            courseTeacherList[i].teachers[index].sunday == '' || courseTeacherList[i].teachers[index].sunday == null ? AppLocalizations.of(context).translate('dayOff') : courseTeacherList[i].teachers[index].sunday,
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
                                            height: 160,
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
                                        Navigation.intent(context, TeacherFormPage.routeName);
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
        }
        else if (state is TeacherNoData) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: SingleChildScrollView(
                  child: CustomErrorWidget(
                    message: AppLocalizations.of(context).translate('noDataAvailable'),
                  )
              )
          );
        }
        else if (state is TeacherNoInternetConnection) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: SingleChildScrollView(
                  child: Column(
                    children: [
                      NoInternetWidget(
                        message: AppLocalizations.of(context).translate('noInternetConnection'),
                      )
                    ],
                  )
              )
          );
        } else if (state is TeacherError) {
          return Scaffold(
              appBar: _getAppBar(context),
              body: CustomErrorWidget(message: AppLocalizations.of(context).translate('unknownError'),));
        }else if (state is TeacherLoading) {
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
                  AppLocalizations.of(context).translate('teachers2'),
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
              ),
              body: CustomErrorWidget(message: AppLocalizations.of(context).translate('unknownError'),)
          );
        }
      },
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
          AppLocalizations.of(context).translate('teachers2'),
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
      /*bottom: TabBar(
          isScrollable: true,
          indicatorPadding: EdgeInsets.only(left: 8, right: 8),
          indicatorColor: ColorPalettes.lightPurple,
          labelColor: ColorPalettes.textColorBlack,
          unselectedLabelColor: ColorPalettes.textColorGrey,
          labelStyle: TextStyle(fontFamily: 'Golos'),  //For Selected tab
          unselectedLabelStyle: TextStyle(fontFamily: 'Golos'),
          tabs: [
            for(int i = 0; i < tabs.length; i++)
              Tab(text: tabs[i].toString()),
          ]
      ),*/
    );
  }

 /* _getTeachers(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: BlocBuilder<TeacherBloc, TeacherState>(
          builder: (context, state) {
            print('State is $state');
            if (state is TeacherHasData) {
              for(int i = 0; i < state.teachersResult.results.length; i++) {
                teacherItems.add(TeacherItem(
                    isExpanded: false,
                    id: state.teachersResult.results[i].id,
                    //headerCity: state.teachersResult.results[i].city,
                    headerName: state.teachersResult.results[i].name,
                    headerSurname: state.teachersResult.results[i].surname,
                    headerMiddleName: state.teachersResult.results[i].middleName,
                    //monday: state.teachersResult.results[i].name,
                    //tuesday: state.teachersResult.results[i].name,
                    //wednesday: state.teachersResult.results[i].name,
                    //thursday: state.teachersResult.results[i].name,
                    //friday: state.teachersResult.results[i].name,
                    //saturday: state.teachersResult.results[i].name,
                ));
              }
              return Scaffold(
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
                      AppLocalizations.of(context).translate('teachers2'),
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
                        labelStyle: TextStyle(fontFamily: 'Golos'),  //For Selected tab
                        unselectedLabelStyle: TextStyle(fontFamily: 'Golos'),
                        tabs: [
                          for(int i = 0; i < courseTabs.length; i++)
                            Tab(text: courseTabs[i].toString()),
                        ]
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      for(int i = 0; i < courseTabs.length; i++)

                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: false,
                            itemCount: teacherItems.length + 1,
                            itemBuilder: (context, index) {
                              if (index != teacherItems.length) {
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
                                        side: BorderSide(width: 1, color: ColorPalettes.boardViewCardStroke)),
                                    child: InkWell(
                                      borderRadius: BorderRadius.all(Radius.circular(14)),
                                      onTap: () {
                                        Navigation.intentWithData(context, TeacherCardPage.routeName, {
                                          AppConstants.CLIENT_ID: teacherItems[index].id,
                                          AppConstants.CLIENT_SURNAME: teacherItems[index].headerSurname,
                                          AppConstants.PAGE_NAME: teacherItems[index].headerName,
                                          AppConstants.CLIENT_MIDDLE_NAME: teacherItems[index].headerMiddleName,
                                        });
                                      },
                                      child: Padding(
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
                                                          child: CircleAvatar(
                                                              minRadius: 35,
                                                              backgroundColor: ColorPalettes.iconGreen,
                                                              child: Text(
                                                                teacherItems[index].headerName[0],
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
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    '${AppLocalizations.of(context).translate('cityLetter')}${teacherItems[index].headerCity??AppLocalizations.of(context).translate('notIndicated')}',
                                                                    style: TextStyle(
                                                                        height: 1.5,
                                                                        color: ColorPalettes.textColorGrey,
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.normal),
                                                                  )
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    teacherItems[index].headerSurname,
                                                                    style: TextStyle(
                                                                        height: 1.5,
                                                                        fontFamily: 'Golos',
                                                                        color: ColorPalettes.textColorBlack,
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    teacherItems[index].headerName,
                                                                    style: TextStyle(
                                                                        height: 1.5,
                                                                        fontFamily: 'Golos',
                                                                        color: ColorPalettes.textColorBlack,
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.w800),
                                                                  ),
                                                                  Text(
                                                                    teacherItems[index].headerMiddleName,
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
                                                            teacherItems[index].isExpanded == true ? IconAssets.dropUpIconPurple : IconAssets.dropDownIconPurple),
                                                            onPressed: () {
                                                              setState(() {
                                                                teacherItems[index].isExpanded = !teacherItems[index].isExpanded;
                                                              });
                                                            }),
                                                      )
                                                    ],
                                                  )),
                                              Container(
                                                transform: Matrix4.translationValues(0.0, -14.0, 0.0),
                                                child: Visibility(
                                                    visible: teacherItems[index].isExpanded,
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
                                                              teacherItems[index].monday,
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
                                                              teacherItems[index].tuesday,
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
                                                              teacherItems[index].wednesday,
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
                                                              teacherItems[index].thursday,
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
                                                              teacherItems[index].friday,
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
                                                              teacherItems[index].saturday,
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
                                                              teacherItems[index].sunday,
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
                                              height: 160,
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
                                          Navigation.intent(context, TeacherFormPage.routeName);
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
              );
            } else if (state is TeacherNoData) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate('noDataAvailable'),
              );
            } else if (state is TeacherNoInternetConnection) {
              return NoInternetWidget(
                message: AppLocalizations.of(context).translate('noInternetConnection'),
              );
            } else if (state is TeacherError) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate('unknownError'),
              );
            }else if (state is TeacherLoading) {
              return Column(
                children: [
                  ListShimmer(160)
                ],
              );
            } else {
              return Text(AppLocalizations.of(context).translate('unknownError'));
            }
          },
        )
    );
  }*/


}

