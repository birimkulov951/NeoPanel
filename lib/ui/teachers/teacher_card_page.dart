import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/notifications_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TeacherCardPage extends StatefulWidget {
  static const routeName = "/teacherCardPage";

  const TeacherCardPage({Key key}) : super(key: key);

  _TeacherCardPage createState() => _TeacherCardPage();
}

class _TeacherCardPage extends State<TeacherCardPage> {
  final List<String> date = <String>[
    '07.07.2020',
    '06.07.2020',
    '08.07.2020',
    '09.07.2020',
    '23.07.2020'
  ];
  final List<String> time = <String>[
    '15:04',
    '11:04',
    '13:04',
    '14:04',
    '12:04'
  ];
  final List<String> commentedName = <String>[
    'Айданова Айдана ',
    'Айданова Айдана ',
    'Айданова Айдана ',
    'Айданова Айдана ',
    'Айданова Айдана '
  ];
  final List<String> comments = <String>[
    'Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.',
    'Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.',
    'Хочет поговорить с учителем.',
    'Хочет поговорить с учителем, лучше назначить встречу.',
    'Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.'
  ];

  final List<String> actionHistory = <String>[
    'Редактировал профиль',
    'Перенес в Записан на пробный урок',
    'Создал заявку',
    'Создал заявку',
    'Создал заявку'
  ];

  int teacherId;
  String teacherSurname;
  String teacherName;
  String teacherMiddleName;
  String teacherPhone;
  String teacherEmail;
  String teacherCity;
  String teacherCourse;
  String teacherMonday;
  String teacherTuesday;
  String teacherWednesday;
  String teacherThursday;
  String teacherFriday;
  String teacherSaturday;
  String teacherSunday;

  String startDate;
  String patent;
  String patentStartDate;
  String patentEndDate;
  List<GroupItem> teacherGroups = [
    GroupItem(name: 'Java'),
    GroupItem(name: 'PHP'),
    GroupItem(name: 'C#'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
    GroupItem(name: 'Java'),
  ];

  bool isLoadedOnce = false;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      teacherId = arguments[AppConstants.CLIENT_ID];
      teacherSurname = arguments[AppConstants.CLIENT_SURNAME];
      teacherName = arguments[AppConstants.CLIENT_NAME];
      teacherMiddleName = arguments[AppConstants.CLIENT_MIDDLE_NAME];

      ///teacherPhone = arguments[AppConstants.CITIES];
      ///teacherEmail = arguments[AppConstants.CITIES];
      ///teacherCity = arguments[AppConstants.CITIES];
      ///teacherCourse = arguments[AppConstants.CITIES];
      ///teacherMonday = arguments[AppConstants.CITIES];
      ///teacherTuesday = arguments[AppConstants.CITIES];
      ///teacherWednesday = arguments[AppConstants.CITIES];
      ///teacherThursday = arguments[AppConstants.CITIES];
      ///teacherFriday = arguments[AppConstants.CITIES];
      ///teacherSaturday = arguments[AppConstants.CITIES];
      ///teacherSunday = arguments[AppConstants.CITIES];
    }

    if (!isLoadedOnce) {
      isLoadedOnce = true;
      context.read<TeacherDetailsBloc>().add(LoadTeacherDetails(teacherId));
    }

    return Scaffold(
      appBar: _getAppBar(context),
      backgroundColor: ColorPalettes.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              teacherCard(context),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('actionHistory'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(width: 1, color: ColorPalettes.greyStroke),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (int item = 0; item < actionHistory.length; item++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  date[item],
                                  style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '  time[item]',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              commentedName[item],
                              style: TextStyle(
                                  height: 1.5,
                                  fontFamily: 'Golos',
                                  color: ColorPalettes.textColorGrey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              actionHistory[item],
                              style: TextStyle(
                                  height: 1.5,
                                  fontFamily: 'Golos',
                                  color: ColorPalettes.textColorBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: ColorPalettes.greyStroke,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          )),
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
        AppLocalizations.of(context).translate('teacherCard'),
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
    );
  }

  Widget teacherCard(BuildContext context) {
    return BlocBuilder<TeacherDetailsBloc, TeacherDetailsState>(
      builder: (context, state) {
        print('State is $state');
        if (state is TeacherDetailsHasData) {
          if (state.teacherDetailsResult != null ||
              state.teacherDetailsResult.teacher != null) {
            //teacherId = state.teacherDetailsResult.teacher.id;
            //teacherSurname = state.teacherDetailsResult.teacher.surname;
            //teacherName = state.teacherDetailsResult.teacher.name;
            //teacherMiddleName = state.teacherDetailsResult.teacher.middleName;
            //teacherCourse = state.teacherDetailsResult.teacher.course;
            teacherPhone = state.teacherDetailsResult.teacher.phone;
            teacherCity = state.teacherDetailsResult.teacher.city;

            ///teacherEmail = state.teacherDetailsResult.teacher.email;
            ///teacherMonday = state.teacherDetailsResult.teacher.id;
            ///teacherTuesday = state.teacherDetailsResult.teacher.id;
            ///teacherWednesday = state.teacherDetailsResult.teacher.id;
            ///teacherThursday = state.teacherDetailsResult.teacher.id;
            ///teacherFriday = state.teacherDetailsResult.teacher.id;
            ///teacherSaturday = state.teacherDetailsResult.teacher.id;
            ///teacherSunday = state.teacherDetailsResult.teacher.id;
            patent = state.teacherDetailsResult.teacher.patent;
            patentStartDate =
                '${state.teacherDetailsResult.teacher.patentStartDate.substring(8, 10) ?? ''}-${state.teacherDetailsResult.teacher.patentStartDate.substring(5, 7) ?? ''}-${state.teacherDetailsResult.teacher.patentStartDate.substring(2, 4) ?? ''}';
            patentEndDate =
                '${state.teacherDetailsResult.teacher.patentEndDate.substring(8, 10) ?? ''}-${state.teacherDetailsResult.teacher.patentEndDate.substring(5, 7) ?? ''}-${state.teacherDetailsResult.teacher.patentEndDate.substring(2, 4) ?? ''}';
            startDate =
                '${patentStartDate ?? ''} | ${state.teacherDetailsResult.teacher.patentStartDate.substring(11, 16) ?? ''}';
          }
          context.read<StudentDetailsBloc>().add(StudentDetailsStateChange());
        }
        if (state is TeacherDetailsNoData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('couldNotDownloadData'));
          });
        }
        if (state is TeacherDetailsNoInternetConnection) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('noInternetConnection'));
          });
        }
        if (state is TeacherDetailsError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('couldNotDownloadData'));
          });
        }
        return Column(
          children: [
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID ${teacherId.toString() ?? ''}',
                  style: TextStyle(
                      color: ColorPalettes.textColorGrey,
                      fontFamily: 'Golos',
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  startDate ?? '',
                  style: TextStyle(
                      color: ColorPalettes.textColorGrey,
                      fontFamily: 'Golos',
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 14),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side:
                    BorderSide(width: 1, color: ColorPalettes.purpleGreyStroke),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${teacherSurname ?? ''} ${teacherName ?? ''} ${teacherMiddleName ?? ''}',
                      style: TextStyle(
                          height: 1.5,
                          fontFamily: 'Golos',
                          color: ColorPalettes.textColorBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      teacherPhone ??
                          AppLocalizations.of(context)
                              .translate('notIndicated'),
                      style: TextStyle(
                          height: 1.5,
                          fontFamily: 'Golos',
                          color: ColorPalettes.textColorBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      teacherEmail ??
                          AppLocalizations.of(context)
                              .translate('notIndicated'),
                      style: TextStyle(
                          height: 1.5,
                          fontFamily: 'Golos',
                          color: ColorPalettes.textColorBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                        transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 0,
                              color: Color(0xFFFDD835),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    teacherCourse ??
                                        AppLocalizations.of(context)
                                            .translate('notIndicated'),
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                          ],
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('city:'),
                          style: TextStyle(
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          teacherCity ??
                              AppLocalizations.of(context)
                                  .translate('notIndicated'),
                          style: TextStyle(
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).translate('schedule'),
                  style: TextStyle(
                      color: ColorPalettes.textColorBlack,
                      fontFamily: 'Golos',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 18),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(width: 1, color: ColorPalettes.greyStroke),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('tu:'),
                          style: TextStyle(
                              color: ColorPalettes.textColorBlack,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          teacherTuesday ??
                              AppLocalizations.of(context).translate('dayOff'),
                          style: TextStyle(
                              color: ColorPalettes.textColorGrey,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('mn:'),
                          style: TextStyle(
                              color: ColorPalettes.textColorBlack,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          teacherMonday ??
                              AppLocalizations.of(context).translate('dayOff'),
                          style: TextStyle(
                              color: ColorPalettes.textColorGrey,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('wd:'),
                          style: TextStyle(
                              color: ColorPalettes.textColorBlack,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          teacherWednesday ??
                              AppLocalizations.of(context).translate('dayOff'),
                          style: TextStyle(
                              color: ColorPalettes.textColorGrey,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('th:'),
                          style: TextStyle(
                              color: ColorPalettes.textColorBlack,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          teacherThursday ??
                              AppLocalizations.of(context).translate('dayOff'),
                          style: TextStyle(
                              color: ColorPalettes.textColorGrey,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('fr:'),
                          style: TextStyle(
                              color: ColorPalettes.textColorBlack,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          teacherFriday ??
                              AppLocalizations.of(context).translate('dayOff'),
                          style: TextStyle(
                              color: ColorPalettes.textColorGrey,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('st:'),
                          style: TextStyle(
                              color: ColorPalettes.textColorBlack,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          teacherSaturday ??
                              AppLocalizations.of(context).translate('dayOff'),
                          style: TextStyle(
                              color: ColorPalettes.textColorGrey,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('sn:'),
                          style: TextStyle(
                              color: ColorPalettes.textColorBlack,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          teacherSunday ??
                              AppLocalizations.of(context).translate('dayOff'),
                          style: TextStyle(
                              color: ColorPalettes.textColorGrey,
                              fontFamily: 'Golos',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).translate('groups'),
                  style: TextStyle(
                      fontFamily: 'Golos',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 18),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(width: 1, color: ColorPalettes.greyStroke),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 50,
                  width: Sizes.width(context) * .9,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: teacherGroups.length,
                    itemBuilder: (_, index) => Container(
                        transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                        margin: EdgeInsets.only(top: 7, bottom: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 0,
                              color: Color(0xFFFDD835),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    teacherGroups[index].name ??
                                        AppLocalizations.of(context)
                                            .translate('notIndicated'),
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).translate('patent'),
                  style: TextStyle(
                      color: ColorPalettes.textColorBlack,
                      fontFamily: 'Golos',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(width: 1, color: ColorPalettes.greyStroke),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('number:'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          patent ??
                              AppLocalizations.of(context)
                                  .translate('notIndicated'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('number:'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          patentStartDate ?? '',
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          AppLocalizations.of(context).translate('until'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          patentEndDate ?? '',
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
