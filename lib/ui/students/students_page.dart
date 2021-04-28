import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/notifications_page.dart';
import 'package:neopanel/ui/students/student_card_page.dart';
import 'package:neopanel/ui/students/student_form_page.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class StudentsPage extends StatefulWidget {
  static const routeName = "/studentsPage";

  const StudentsPage({Key key}) : super(key: key);

  _StudentsPage createState() => _StudentsPage();
}

class _StudentsPage extends State<StudentsPage> {

  String returnedGroup;
  String returnedGroupIndex = "xxxxx";
  int returnedGroupId;
  int studentsCount;
  int studentsInGroup;


  // Group details datas
  String groupName;
  String groupCourse;
  String groupCity;
  String groupTeacher;
  String groupStartDate;
  String groupEndDate;
  int groupMonths;
  int groupContractSum;
  int groupStudentCount;


  final List<CourseItem> courses = [];
  final List<GroupItem> groups = [];
  List<StudentItem> studentsByGroups = [];
  List<StudentItem> students = [];


  @override
  void initState() {
    context.read<CourseBloc>().add(GetCourses());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Container(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    print('State is $state');
                    if (state is GroupHasData) {
                      groups.clear();
                      for (int i = 0; i <
                          state.groupsResult.results.length; i++) {
                        groups.add(GroupItem(
                            id: state.groupsResult.results[i].id,
                            name: state.groupsResult.results[i].name,
                            cityName: state.groupsResult.results[i].cityName,
                            months: state.groupsResult.results[i].months));
                      }
                    }
                    if (state is GroupNoData) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        CustomToast.showCustomToast(context,
                            AppLocalizations.of(context).translate(
                                'couldNotDownloadGroupsData'));
                      });
                    }

                    if (state is CourseHasData) {
                      courses.clear();
                      for (int i = 0; i <
                          state.coursesResult.results.length; i++) {
                        courses.add(CourseItem(
                            id: state.coursesResult.results[i].id,
                            name: state.coursesResult.results[i].name,
                            color: state.coursesResult.results[i].color.replaceAll('#', '0xff')));
                      }
                    }
                    if (state is CourseNoData) {
                      return Text('');
                    } else if (state is CourseNoInternetConnection) {
                      return Text('');
                    } else if (state is CourseError) {
                      return Text('');
                    } else if (state is CourseLoading) {
                      return SizedBox(
                          height: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              reverse: false,
                              itemCount: 6,
                              itemBuilder: (_, index) {
                                if (index == 0) {
                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          returnedGroup = null;
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        child: Card(
                                            margin: EdgeInsets.only(left: 18,
                                                top: 10,
                                                right: 5,
                                                bottom: 10),
                                            elevation: 0,
                                            color: returnedGroup == null
                                                ? ColorPalettes.lightPurple
                                                : ColorPalettes.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                                side: BorderSide(width: 1,
                                                    color: ColorPalettes
                                                        .lightPurple)),
                                            child: Center(
                                              child: Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                    left: 14.0,
                                                    right: 14.0,
                                                    top: 6.0,
                                                    bottom: 6.0,
                                                  ),
                                                  child: Text(
                                                      '${AppLocalizations.of(
                                                          context).translate(
                                                          'all')} ${studentsCount ??
                                                          ''}',
                                                      style: TextStyle(
                                                          fontFamily: 'Golos',
                                                          fontSize: 15,
                                                          color: returnedGroup ==
                                                              null
                                                              ? ColorPalettes
                                                              .white
                                                              : ColorPalettes
                                                              .textColorGrey,
                                                          fontWeight: returnedGroup ==
                                                              null ? FontWeight
                                                              .w500 : FontWeight
                                                              .w400
                                                      )
                                                  )
                                              ),
                                            )
                                        ),
                                      )
                                  );
                                } else {
                                  return Shimmer.fromColors(
                                    baseColor: ColorPalettes.greyBg,
                                    highlightColor: ColorPalettes.white,
                                    child: Container(
                                      height: 50,
                                      width: Sizes.width(context) * .20,
                                      margin: EdgeInsets.only(left: 5,
                                          top: 10,
                                          right: 5,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                          color: ColorPalettes.greyBg,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))
                                      ),
                                    ),
                                  );
                                }
                              }
                          )
                      );
                    } else {
                      return SizedBox(
                          height: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              reverse: false,
                              itemCount: courses.length + 1,
                              itemBuilder: (_, index) {
                                if (index == 0) {
                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          returnedGroup = null;
                                          returnedGroupIndex = "xxxxx";
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        child: Card(
                                            margin: EdgeInsets.only(left: 18,
                                                top: 10,
                                                right: 5,
                                                bottom: 10),
                                            elevation: 0,
                                            color: returnedGroup == null
                                                ? ColorPalettes.lightPurple
                                                : ColorPalettes.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                                side: BorderSide(width: 1,
                                                    color: ColorPalettes
                                                        .lightPurple)),
                                            child: Center(
                                              child: Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                    left: 14.0,
                                                    right: 14.0,
                                                    top: 6.0,
                                                    bottom: 6.0,
                                                  ),
                                                  child: Text(
                                                      '${AppLocalizations.of(
                                                          context).translate(
                                                          'all')} ${studentsCount ??
                                                          ''}',
                                                      style: TextStyle(
                                                          fontFamily: 'Golos',
                                                          fontSize: 15,
                                                          color: returnedGroup ==
                                                              null
                                                              ? ColorPalettes
                                                              .white
                                                              : ColorPalettes
                                                              .textColorGrey,
                                                          fontWeight: returnedGroup ==
                                                              null ? FontWeight
                                                              .w500 : FontWeight
                                                              .w400
                                                      )
                                                  )
                                              ),
                                            )
                                        ),
                                      )
                                  );
                                }
                                else {
                                  int value = int.parse(courses[index - 1].color);
                                  Color cardColor = new Color(value);
                                  return InkWell(
                                      onTap: () async {
                                        final List<String> groupNames = [];
                                        for (int i = 0; i < groups.length; i++) {
                                          if (groups[i].name.contains(
                                              courses[index - 1].name)) {
                                            groupNames.add(groups[i].name);
                                          }
                                        }
                                        await showDialog(context: context,
                                            builder: (context) =>
                                                CustomDialogList(
                                                    title: AppLocalizations.of(
                                                        context).translate(
                                                        'chooseGroup'),
                                                    listData: groupNames))
                                            .then((value) =>
                                        returnedGroup = value);
                                        setState(() {
                                          if (returnedGroup != null) {
                                            returnedGroupIndex = returnedGroup;
                                          }
                                          for(int i = 0; i < groups.length; i++) {
                                            if (groups[i].name == returnedGroup) {
                                              returnedGroupId = groups[i].id;
                                              context.read<StudentsBloc>().add(GetGroupDetails(returnedGroupId));
                                            }
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        child: Card(
                                            margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 10),
                                            elevation: 0,
                                            color: returnedGroupIndex.contains(courses[index-1].name)??false ? cardColor : ColorPalettes.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(width: 1, color: cardColor)),
                                            child: Center(
                                              child: Padding(
                                                  padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 6.0, bottom: 6.0,),
                                                  child: Text(
                                                      returnedGroupIndex.contains(courses[index-1].name) ? '$returnedGroupIndex'/* ${studentsInGroup??''}*/ : courses[index - 1].name.toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'Golos',
                                                          fontSize: 15,
                                                          color: returnedGroupIndex.contains(courses[index-1].name) ? ColorPalettes.white : ColorPalettes.textColorGrey,
                                                          fontWeight: returnedGroupIndex.contains(courses[index-1].name) ? FontWeight.w500 : FontWeight.w400
                                                      )
                                                  )
                                              ),
                                            )
                                        ),
                                      )
                                  );
                                }
                              }
                          )
                      );
                    }
                  },
                ),
                Expanded(child: returnedGroup == null
                    ? _getStudents(context)
                    : _getStudentsByGroups(context, returnedGroup)),
              ]
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
        AppLocalizations.of(context).translate('students'),
        style: TextStyle(
            color: ColorPalettes.textColorBlack,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        Visibility(
          visible: returnedGroup == null ? false : true,
          child: IconButton(
              icon: SvgPicture.asset(IconAssets.detailsIconBlack),
              onPressed: () {
                showDialog(context: context, builder: (context) =>
                    CustomDialogGroupInfo(
                      title: AppLocalizations.of(context).translate('groupInfo'),
                      groupTitle: '$groupName (${groupMonths.toString()} ${AppLocalizations.of(context).translate('months2')})',
                      groupStartDate: '${groupStartDate.substring(8,10)??''}.${groupStartDate.substring(5,7)??''}.${groupStartDate.substring(2,4)??''}',
                      groupEndDate: '${groupEndDate.substring(8,10)??''}.${groupEndDate.substring(5,7)??''}.${groupEndDate.substring(2,4)??''}',
                      groupTeacher: groupTeacher,
                      groupStudentsCount: groupStudentCount.toString(),
                      groupPrice: groupContractSum.toString(),
                      groupCity: groupCity,
                      buttonTitle: AppLocalizations.of(context).translate('toArchive2'),
                      onPressed: () {
                        // archive here
                        Navigator.pop(context);
                      },
                    ));
              }),
        ),
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

  _getStudents(BuildContext context) {
    context.read<StudentsBloc>().add(GetStudents());
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: BlocBuilder<StudentsBloc, StudentsState>(
          builder: (context, state) {
            print('State is $state');
            if (state is StudentsHasData) {

              studentsCount = state.studentsResult.results.length;
              students.clear();
              for (int i = 0; i < state.studentsResult.results.length; i++) {
                  StudentItem student = StudentItem(id: state.studentsResult.results[i].id, surname: state.studentsResult.results[i].surname, name: state.studentsResult.results[i].name, middleName: state.studentsResult.results[i].middleName, cityName: state.studentsResult.results[i].cityName ?? AppLocalizations.of(context).translate('notIndicated'), groupName: state.studentsResult.results[i].groupName ?? AppLocalizations.of(context).translate('notIndicated'), teacherName: state.studentsResult.results[i].teacherName ?? AppLocalizations.of(context).translate('notIndicated'), startDate: state.studentsResult.results[i].startDate, endDate: state.studentsResult.results[i].endDate, paymentStatus: state.studentsResult.results[i].paymentStatus ?? AppLocalizations.of(context).translate('notIndicated'));
                  students.add(student);
              }

              return Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  itemCount: state.studentsResult.results.length + 1,
                  itemBuilder: (context, index) {
                    if (index != state.studentsResult.results.length) {
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
                              side: BorderSide(width: 1,
                                  color: ColorPalettes.boardViewCardStroke)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            onTap: () {
                              Navigation.intentWithData(
                                  context, StudentCardPage.routeName, {
                                AppConstants.CLIENT_ID: state.studentsResult
                                    .results[index].id,
                                AppConstants.CLIENT_SURNAME: state
                                    .studentsResult.results[index].surname,
                                AppConstants.CLIENT_NAME: state.studentsResult
                                    .results[index].name,
                                AppConstants.CLIENT_MIDDLE_NAME: state
                                    .studentsResult.results[index].middleName,
                                AppConstants.CLIENT_CITY: state.studentsResult
                                    .results[index].cityName,
                                AppConstants.CLIENT_GROUP: state.studentsResult
                                    .results[index].groupName,
                                AppConstants.CLIENT_TEACHER: state
                                    .studentsResult.results[index].teacherName,
                                AppConstants.CLIENT_START_DATE: state
                                    .studentsResult.results[index].startDate,
                                AppConstants.CLIENT_END_DATE: state
                                    .studentsResult.results[index].endDate,
                                AppConstants.CLIENT_PAYMENT_STATUS: state
                                    .studentsResult.results[index].paymentStatus
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${AppLocalizations.of(context).translate('cityLetter')}${state.studentsResult.results[index].cityName}',
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
                                                '${state.studentsResult.results[index].startDate.substring(8, 10)}-${state.studentsResult.results[index].startDate.substring(5, 7)}-${state.studentsResult.results[index].startDate.substring(2, 4)}',
                                                style: TextStyle(
                                                    height: 1.5,
                                                    fontFamily: 'Golos',
                                                    color: ColorPalettes.textColorGrey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              Text(
                                                ' | ${state.studentsResult
                                                    .results[index].endDate
                                                    .substring(8, 10)}-${state
                                                    .studentsResult
                                                    .results[index].endDate
                                                    .substring(5, 7)}-${state
                                                    .studentsResult
                                                    .results[index].endDate
                                                    .substring(2, 4)}',
                                                style: TextStyle(
                                                    fontFamily: 'Golos',
                                                    color: ColorPalettes
                                                        .textColorGrey,
                                                    height: 1.5,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight
                                                        .w400),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        transform: Matrix4.translationValues(
                                            0.0, 0.0, 0.0),
                                        child: Text(
                                          '${state.studentsResult.results[index]
                                              .surname ?? ''} ${state
                                              .studentsResult.results[index]
                                              .name ?? ''} ${state
                                              .studentsResult.results[index]
                                              .middleName ?? ''}',
                                          style: TextStyle(
                                              fontFamily: 'Golos',
                                              color: ColorPalettes
                                                  .textColorBlack,
                                              height: 1.5,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800),
                                        )
                                    ),
                                    Text(
                                      '${AppLocalizations.of(context).translate(
                                          'teacherLetter:')}${state
                                          .studentsResult.results[index]
                                          .teacherName ??
                                          AppLocalizations.of(context)
                                              .translate('notIndicated')}',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          height: 1.5,
                                          color: ColorPalettes.textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Container(
                                          transform: Matrix4.translationValues(
                                              -5.0, 0.0, 0.0),
                                          child: Card(
                                            elevation: 0,
                                            color: Color(0xFFFDD835),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(6)),
                                            child: Padding(
                                                padding: const EdgeInsets.all(
                                                    6.0),
                                                child: Text(
                                                  state.studentsResult
                                                      .results[index]
                                                      .groupName ??
                                                      AppLocalizations.of(
                                                          context).translate(
                                                          'notIndicated'),
                                                  style: TextStyle(
                                                      fontFamily: 'Golos',
                                                      color: ColorPalettes
                                                          .white,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight
                                                          .w800),
                                                )),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .translate('payment:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes
                                                      .textColorGrey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight
                                                      .normal),
                                            ),
                                            Text(
                                              state.studentsResult
                                                  .results[index]
                                                  .paymentStatus ?? '',
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes
                                                      .textColorGrey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight
                                                      .normal),
                                            ),
                                            Container(
                                              transform: Matrix4
                                                  .translationValues(
                                                  0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(
                                                  IconAssets.successfulIcon),
                                            )
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
                          padding: EdgeInsets.only(
                              top: 7, bottom: 14, left: 18, right: 18),
                          child: Material(
                            child: InkWell(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(14)),
                              child: DottedBorder(
                                dashPattern: [5, 5, 5, 5],
                                borderType: BorderType.RRect,
                                radius: Radius.circular(14),
                                color: ColorPalettes.purpleGreyStroke,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(14)),
                                  child: Container(
                                    height: 128,
                                    width: Sizes.width(context) * .88,
                                    child: Center(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(14),
                                                border: Border.all(width: 1,
                                                    color: ColorPalettes
                                                        .greyStroke)),
                                            child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                    IconAssets.addIconWhite)
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigation.intent(
                                    context, StudentFormPage.routeName);
                              },
                            ),
                          )
                      );
                    }
                  },
                ),
              );
            } else if (state is StudentsNoData) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate(
                    'noDataAvailable'),
              );
            } else if (state is StudentsNoInternetConnection) {
              return NoInternetWidget(
                message: AppLocalizations.of(context).translate(
                    'noInternetConnection'),
              );
            } else if (state is StudentsError) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate('unknownError'),
              );
            } else if (state is StudentsLoading) {
              return ListShimmer(128);
            } else {
              return CustomErrorWidget(
                  message: AppLocalizations.of(context).translate('unknownError'));
            }
          },
        )
    );
  }

  _getStudentsByGroups(BuildContext context, String returnedGroup) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: BlocBuilder<StudentsBloc, StudentsState>(
          builder: (context, state) {
            print('State is $state');

            if (state is GroupDetailsHasData) {
              groupName = state.groupDetailsResult.group.name;
              groupCourse = state.groupDetailsResult.group.course;
              groupCity = state.groupDetailsResult.group.city;
              groupTeacher = state.groupDetailsResult.group.teacher;
              groupStartDate = state.groupDetailsResult.group.startDate;
              groupEndDate = state.groupDetailsResult.group.endDate;
              groupMonths = state.groupDetailsResult.group.months;
              groupContractSum = state.groupDetailsResult.group.contractSum;
              groupStudentCount = state.groupDetailsResult.group.studentCount;

              studentsByGroups.clear();
              for (int i = 0; i < students.length; i++) {
                if (returnedGroup == students[i].groupName) {
                  StudentItem student = StudentItem(
                    id: students[i].id,
                    surname: students[i].surname,
                    name: students[i].name,
                    middleName: students[i].middleName,
                    cityName: students[i].cityName ?? AppLocalizations.of(context).translate('notIndicated'),
                    groupName: students[i].groupName ?? AppLocalizations.of(context).translate('notIndicated'),
                    teacherName: students[i].teacherName ?? AppLocalizations.of(context).translate('notIndicated'),
                    startDate: students[i].startDate,
                    endDate: students[i].endDate,
                    paymentStatus: students[i].paymentStatus ?? AppLocalizations.of(context).translate('notIndicated'),
                  );
                  studentsByGroups.add(student);
                }
              }

              studentsInGroup = studentsByGroups.length;
              //WidgetsBinding.instance.addPostFrameCallback((_) {setState(() {});});
              return Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  itemCount: studentsByGroups.length + 1,
                  itemBuilder: (context, index) {
                    if (index != studentsByGroups.length) {
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
                              side: BorderSide(width: 1,
                                  color: ColorPalettes.boardViewCardStroke)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            onTap: () {
                              Navigation.intentWithData(
                                  context, StudentCardPage.routeName, {
                                AppConstants.CLIENT_ID: studentsByGroups[index].id,
                                AppConstants.CLIENT_SURNAME: studentsByGroups[index].surname,
                                AppConstants.CLIENT_NAME: studentsByGroups[index].name,
                                AppConstants.CLIENT_MIDDLE_NAME: studentsByGroups[index].middleName,
                                AppConstants.CLIENT_CITY: studentsByGroups[index].cityName,
                                AppConstants.CLIENT_GROUP: studentsByGroups[index].groupName,
                                AppConstants.CLIENT_TEACHER: studentsByGroups[index].teacherName,
                                AppConstants.CLIENT_START_DATE: studentsByGroups[index].startDate,
                                AppConstants.CLIENT_END_DATE: studentsByGroups[index].endDate,
                                AppConstants.CLIENT_PAYMENT_STATUS: studentsByGroups[index].paymentStatus
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
                                    Text(
                                      '${AppLocalizations.of(context).translate(
                                          'cityLetter')}${studentsByGroups[index].cityName}',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                        transform: Matrix4.translationValues(
                                            0.0, 0.0, 0.0),
                                        child: Text(
                                          '${studentsByGroups[index].surname ??
                                              ''} ${studentsByGroups[index].name ??
                                              ''} ${studentsByGroups[index]
                                              .middleName ?? ''}',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes
                                                  .textColorBlack,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800),
                                        )
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '#phone',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          height: 1.5,
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              '${AppLocalizations.of(context)
                                                  .translate('laptop')}: ',
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes
                                                      .textColorBlack,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight
                                                      .normal),
                                            ),
                                            Container(
                                              transform: Matrix4
                                                  .translationValues(
                                                  0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(
                                                  IconAssets.successfulIcon),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .translate('payment:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes
                                                      .textColorBlack,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight
                                                      .normal),
                                            ),
                                            Container(
                                              transform: Matrix4
                                                  .translationValues(
                                                  0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(
                                                  IconAssets.successfulIcon),
                                            ),
                                            Visibility(
                                                visible: true,
                                                child: Container(
                                                  transform: Matrix4
                                                      .translationValues(
                                                      0.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                      IconAssets
                                                          .successfulIcon),
                                                )
                                            ),
                                            Visibility(
                                                visible: true,
                                                child: Container(
                                                  transform: Matrix4
                                                      .translationValues(
                                                      0.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                      IconAssets.minusIcon),
                                                )
                                            ),
                                            Visibility(
                                                visible: true,
                                                child: Container(
                                                  transform: Matrix4
                                                      .translationValues(
                                                      0.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                      IconAssets
                                                          .unsuccessfulIcon),
                                                )
                                            )
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
                          padding: EdgeInsets.only(
                              top: 7, bottom: 14, left: 18, right: 18),
                          child: Material(
                            child: InkWell(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(14)),
                              child: DottedBorder(
                                dashPattern: [5, 5, 5, 5],
                                borderType: BorderType.RRect,
                                radius: Radius.circular(14),
                                color: ColorPalettes.purpleGreyStroke,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(14)),
                                  child: Container(
                                    height: 120,
                                    width: Sizes.width(context) * .88,
                                    child: Center(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(14),
                                                border: Border.all(width: 1,
                                                    color: ColorPalettes
                                                        .greyStroke)),
                                            child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                    IconAssets.addIconWhite)
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigation.intent(
                                    context, StudentFormPage.routeName);
                              },
                            ),
                          )
                      );
                    }
                  },
                ),
              );
            }
            if (state is GroupDetailsNoData) {}
            if (state is GroupDetailsError) {}

            if (state is StudentsHasData) {

              studentsByGroups.clear();
              for (int i = 0; i < students.length; i++) {
                if (returnedGroup == students[i].groupName) {
                  StudentItem student = StudentItem(
                    id: students[i].id,
                    surname: students[i].surname,
                    name: students[i].name,
                    middleName: students[i].middleName,
                    cityName: students[i].cityName ?? AppLocalizations.of(context).translate('notIndicated'),
                    groupName: students[i].groupName ?? AppLocalizations.of(context).translate('notIndicated'),
                    teacherName: students[i].teacherName ?? AppLocalizations.of(context).translate('notIndicated'),
                    startDate: students[i].startDate,
                    endDate: students[i].endDate,
                    paymentStatus: students[i].paymentStatus ?? AppLocalizations.of(context).translate('notIndicated'),
                  );
                  studentsByGroups.add(student);
                }
              }
              studentsInGroup = studentsByGroups.length;
              WidgetsBinding.instance.addPostFrameCallback((_) {setState(() {});});
              return Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  itemCount: studentsByGroups.length + 1,
                  itemBuilder: (context, index) {
                    if (index != studentsByGroups.length) {
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
                              side: BorderSide(width: 1,
                                  color: ColorPalettes.boardViewCardStroke)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            onTap: () {
                              Navigation.intentWithData(
                                  context, StudentCardPage.routeName, {
                                AppConstants.CLIENT_ID: studentsByGroups[index].id,
                                AppConstants.CLIENT_SURNAME: studentsByGroups[index].surname,
                                AppConstants.CLIENT_NAME: studentsByGroups[index].name,
                                AppConstants.CLIENT_MIDDLE_NAME: studentsByGroups[index].middleName,
                                AppConstants.CLIENT_CITY: studentsByGroups[index].cityName,
                                AppConstants.CLIENT_GROUP: studentsByGroups[index].groupName,
                                AppConstants.CLIENT_TEACHER: studentsByGroups[index].teacherName,
                                AppConstants.CLIENT_START_DATE: studentsByGroups[index].startDate,
                                AppConstants.CLIENT_END_DATE: studentsByGroups[index].endDate,
                                AppConstants.CLIENT_PAYMENT_STATUS: studentsByGroups[index].paymentStatus
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
                                    Text(
                                      '${AppLocalizations.of(context).translate(
                                          'cityLetter')}${studentsByGroups[index].cityName}',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                        transform: Matrix4.translationValues(
                                            0.0, 0.0, 0.0),
                                        child: Text(
                                          '${studentsByGroups[index].surname ??
                                              ''} ${studentsByGroups[index].name ??
                                              ''} ${studentsByGroups[index]
                                              .middleName ?? ''}',
                                          style: TextStyle(
                                              fontFamily: 'Golos',
                                              height: 1.5,
                                              color: ColorPalettes
                                                  .textColorBlack,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800),
                                        )
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '#phone',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          height: 1.5,
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              '${AppLocalizations.of(context)
                                                  .translate('laptop')}: ',
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes
                                                      .textColorGrey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight
                                                      .normal),
                                            ),
                                            Container(
                                              transform: Matrix4
                                                  .translationValues(
                                                  0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(
                                                  IconAssets.successfulIcon),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .translate('payment:'),
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontFamily: 'Golos',
                                                  color: ColorPalettes
                                                      .textColorGrey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight
                                                      .normal),
                                            ),
                                            Container(
                                              transform: Matrix4
                                                  .translationValues(
                                                  0.0, 0.0, 0.0),
                                              child: SvgPicture.asset(
                                                  IconAssets.successfulIcon),
                                            ),
                                            Visibility(
                                                visible: true,
                                                child: Container(
                                                  transform: Matrix4
                                                      .translationValues(
                                                      0.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                      IconAssets
                                                          .successfulIcon),
                                                )
                                            ),
                                            Visibility(
                                                visible: true,
                                                child: Container(
                                                  transform: Matrix4
                                                      .translationValues(
                                                      0.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                      IconAssets.minusIcon),
                                                )
                                            ),
                                            Visibility(
                                                visible: true,
                                                child: Container(
                                                  transform: Matrix4
                                                      .translationValues(
                                                      0.0, 0.0, 0.0),
                                                  child: SvgPicture.asset(
                                                      IconAssets
                                                          .unsuccessfulIcon),
                                                )
                                            )
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
                          padding: EdgeInsets.only(
                              top: 7, bottom: 14, left: 18, right: 18),
                          child: Material(
                            child: InkWell(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(14)),
                              child: DottedBorder(
                                dashPattern: [5, 5, 5, 5],
                                borderType: BorderType.RRect,
                                radius: Radius.circular(14),
                                color: ColorPalettes.purpleGreyStroke,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(14)),
                                  child: Container(
                                    height: 120,
                                    width: Sizes.width(context) * .88,
                                    child: Center(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(14),
                                                border: Border.all(width: 1,
                                                    color: ColorPalettes
                                                        .greyStroke)),
                                            child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                    IconAssets.addIconWhite)
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigation.intent(
                                    context, StudentFormPage.routeName);
                              },
                            ),
                          )
                      );
                    }
                  },
                ),
              );
            }
            else if (state is StudentsNoData) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate(
                    'noDataAvailable'),
              );
            } else if (state is StudentsNoInternetConnection) {
              return NoInternetWidget(
                message: AppLocalizations.of(context).translate(
                    'noInternetConnection'),
              );
            } else if (state is StudentsError) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate('unknownError'),
              );
            } else if (state is StudentsLoading) {
              return ListShimmer(128);
            } else {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate('unknownError'),
              );
            }
          },
        )
    );
  }

 /* _getAllStudents(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        reverse: false,
        itemCount: names.length,
        itemBuilder: (_, index) =>
            InkWell(
              onTap: () {
                //CustomToast.showCustomToast(context, "Open Card index ${listData[listIndex].items[itemIndex].name}");
                Navigation.intentWithData(context, StudentCardPage.routeName, {
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
              child: Card(
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
                      bottom: 7.0,
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
                                  AppLocalizations.of(context).translate(
                                      'cityLetter'),
                                  style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  '#City#',
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
                                    '#date#',
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.textColorGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    ' | ',
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.textColorGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '#hours#',
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.textColorGrey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
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
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate(
                                  'teacherLetter:'),
                              style: TextStyle(
                                  fontFamily: 'Golos',
                                  height: 1.5,
                                  color: ColorPalettes.textColorBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '#teacherName#',
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
                              transform: Matrix4.translationValues(
                                  -5.0, 0.0, 0.0),
                              child: Card(
                                elevation: 0,
                                color: Color(0xFFFDD835),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      '#groupName#',
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
                                  AppLocalizations.of(context).translate(
                                      'payment:'),
                                  style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                                Container(
                                  transform: Matrix4.translationValues(0.0, 0.0,
                                      0.0),
                                  child: SvgPicture.asset(IconAssets
                                      .successfulIcon),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            )
    );
  }*/


}
