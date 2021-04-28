import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class TeacherFormPage extends StatefulWidget {
  static const routeName = "/teacherFormPage";

  const TeacherFormPage({Key key}) : super(key: key);

  _TeacherFormPage createState() => _TeacherFormPage();
}

class _TeacherFormPage extends State<TeacherFormPage> {

  FocusNode surnameNode;
  FocusNode nameNode;
  FocusNode middleNameNode;
  FocusNode emailNode;
  FocusNode phoneNode;
  FocusNode patentNumberNode;

  String _valueChooseCity;
  List _listOfCities = ['Talas','Bishkek','London'];

  String _valueChooseCourse;
  List _listOfCourses = ['PHP','Java','Swift'];

  DateTime currentTime = DateTime.now();
  DateTime responseStartDate;
  DateTime responseEndDate;
  String selectedStartDate;
  String selectedEndDate;

  bool isMondayChecked = false;
  bool isTuesdayChecked = false;
  bool isWednesdayChecked = false;
  bool isThursdayChecked = false;
  bool isFridayChecked = false;
  bool isSaturdayChecked = false;
  bool isSundayChecked = false;

  String mondayStartTime;
  String mondayEndTime;
  String tuesdayStartTime;
  String tuesdayEndTime;
  String wednesdayStartTime;
  String wednesdayEndTime;
  String thursdayStartTime;
  String thursdayEndTime;
  String fridayStartTime;
  String fridayEndTime;
  String saturdayStartTime;
  String saturdayEndTime;
  String sundayStartTime;
  String sundayEndTime;

  @override
  void initState() {
    super.initState();
    surnameNode = FocusNode();
    nameNode = FocusNode();
    middleNameNode = FocusNode();
    emailNode = FocusNode();
    phoneNode = FocusNode();
    patentNumberNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    surnameNode.dispose();
    nameNode.dispose();
    middleNameNode.dispose();
    emailNode.dispose();
    phoneNode.dispose();
    patentNumberNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Center(
        child:  SingleChildScrollView(
            child: _form(context)),
      )
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
          AppLocalizations.of(context).translate('addingTeacher'),
        style: TextStyle(
            color: ColorPalettes.textColorBlack,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w500),
      ),
      centerTitle: false,
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            width: Sizes.width(context) * .9,
            child:  Text(
              AppLocalizations.of(context).translate('privateInfo'),
              style: TextStyle(
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 25),
          CustomText(text: AppLocalizations.of(context).translate('surname'),),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: surnameNode,
            keyboardType: TextInputType.name,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('name')),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: nameNode,
            keyboardType: TextInputType.name,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 20),
          CustomText(
              text: AppLocalizations.of(context).translate('middleName')),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: middleNameNode,
            keyboardType: TextInputType.name,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 40),
          Container(
            width: Sizes.width(context) * .9,
            child: Text(
              AppLocalizations.of(context).translate('contactInfo'),
              style: TextStyle(
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 25),
          CustomText(text: AppLocalizations.of(context).translate('email'), isRequiredField: false,),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: emailNode,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('phone')),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: phoneNode,
            keyboardType: TextInputType.phone,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).requestFocus(patentNumberNode),
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('city')),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChooseCity,
            listItems: _listOfCities,
          ),
          SizedBox(height: 40),
          Container(
            width: Sizes.width(context) * .9,
            child: Text(
              AppLocalizations.of(context).translate('systemInfo'),
              style: TextStyle(
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 25),
          CustomText(text: AppLocalizations.of(context).translate('patentNumber')),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: patentNumberNode,
            keyboardType: TextInputType.phone,
            maxLines: 1
          ),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).translate('startPeriod:'),
                      style: TextStyle(
                          color: ColorPalettes.textColorGrey,
                          fontFamily: 'Golos',
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                      )),
                  CustomButtonPurpleStroke(
                    text: selectedStartDate??'01.01.2017',
                    //'${startPeriodDate.day??'01'}.${startPeriodDate.month??'01'}.${startPeriodDate.year??'2000'}',
                    isValueEntered: selectedStartDate != null ? true : false,
                    onPressed: () async {
                      responseStartDate = await showDatePicker(
                          context: context,
                          initialDate: currentTime,
                          firstDate: DateTime(2017, 1, 1),
                          lastDate: DateTime(2027, 1, 1));
                      if (responseStartDate != null && responseStartDate != currentTime)
                        setState(() {
                          selectedStartDate = '${responseStartDate.day}.${responseStartDate.month}.${responseStartDate.year}';
                        });
                    },
                  ),
                  Text(AppLocalizations.of(context).translate('until'),
                      style: TextStyle(
                          color: ColorPalettes.textColorGrey,
                          fontFamily: 'Golos',
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                      )),
                  CustomButtonPurpleStroke(
                    text: selectedEndDate??'01.01.2037',
                    isValueEntered: selectedEndDate != null ? true : false,
                    onPressed: () async {
                      responseEndDate = await showDatePicker(
                          context: context,
                          initialDate: currentTime,
                          firstDate: DateTime(2017, 1, 1),
                          lastDate: DateTime(2037, 1, 1));
                      if (responseEndDate != null && responseEndDate != currentTime)
                        setState(() {
                          selectedEndDate = '${responseEndDate.day}.${responseEndDate.month}.${responseEndDate.year}';
                        });
                    },
                  ),
                ],
              )),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('course')),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChooseCourse,
            listItems: _listOfCourses,
          ),
          SizedBox(height: 40),
          Container(
            width: Sizes.width(context) * .9,
            child: Text(
              AppLocalizations.of(context).translate('schedule'),
              style: TextStyle(
                  color: ColorPalettes.textColorBlack,
                  fontFamily: 'Golos',
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 20),
          Container(
              width: Sizes.width(context) * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: ColorPalettes.lightGreen,),
                            child: Checkbox(
                              activeColor: ColorPalettes.lightGreen,
                              value: isMondayChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isMondayChecked = value;
                                  print(isMondayChecked);
                                });
                              },
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                            child: Text(
                                AppLocalizations.of(context).translate('monday'),
                                style: TextStyle(
                                  color: ColorPalettes.textColorBlack,
                                  fontFamily: 'Golos',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButtonWhiteStroke(
                          text: mondayStartTime??'00:00',
                          isValueEntered: mondayStartTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                mondayStartTime = result.format(context);
                              });
                            }
                          },
                        ),
                        Text(' - ',
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )),
                        CustomButtonWhiteStroke(
                          text: mondayEndTime??'00:00',
                          isValueEntered: mondayEndTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                mondayEndTime = result.format(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),

                  ])
          ),
          Container(
              width: Sizes.width(context) * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: ColorPalettes.lightGreen,),
                            child: Checkbox(
                              activeColor: ColorPalettes.lightGreen,
                              value: isTuesdayChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isTuesdayChecked = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                            child: Text(
                                AppLocalizations.of(context).translate('tuesday'),
                                style: TextStyle(
                                    color: ColorPalettes.textColorBlack,
                                    fontFamily: 'Golos',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButtonWhiteStroke(
                          text: tuesdayStartTime??'00:00',
                          isValueEntered: tuesdayStartTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                tuesdayStartTime = result.format(context);
                              });
                            }
                          },
                        ),
                        Text(' - ',
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )),
                        CustomButtonWhiteStroke(
                          text: tuesdayEndTime??'00:00',
                          isValueEntered: tuesdayEndTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                tuesdayEndTime = result.format(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),

                  ])
          ),
          Container(
              width: Sizes.width(context) * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: ColorPalettes.lightGreen,),
                            child: Checkbox(
                              activeColor: ColorPalettes.lightGreen,
                              value: isWednesdayChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isWednesdayChecked = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                            child: Text(
                                AppLocalizations.of(context).translate('wednesday'),
                                style: TextStyle(
                                    color: ColorPalettes.textColorBlack,
                                    fontFamily: 'Golos',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButtonWhiteStroke(
                          text: wednesdayStartTime??'00:00',
                          isValueEntered: wednesdayStartTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                wednesdayStartTime = result.format(context);
                              });
                            }
                          },
                        ),
                        Text(' - ',
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )),
                        CustomButtonWhiteStroke(
                          text: wednesdayEndTime??'00:00',
                          isValueEntered: wednesdayEndTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                wednesdayEndTime = result.format(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ])
          ),
          Container(
              width: Sizes.width(context) * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: ColorPalettes.lightGreen,),
                            child: Checkbox(
                              activeColor: ColorPalettes.lightGreen,
                              value: isThursdayChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isThursdayChecked = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                            child: Text(
                                AppLocalizations.of(context).translate('thursday'),
                                style: TextStyle(
                                    color: ColorPalettes.textColorBlack,
                                    fontFamily: 'Golos',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButtonWhiteStroke(
                          text: thursdayStartTime??'00:00',
                          isValueEntered: thursdayStartTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                thursdayStartTime = result.format(context);
                              });
                            }
                          },
                        ),
                        Text(' - ',
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )),
                        CustomButtonWhiteStroke(
                          text: thursdayEndTime??'00:00',
                          isValueEntered: thursdayEndTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                thursdayEndTime = result.format(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ])
          ),
          Container(
              width: Sizes.width(context) * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: ColorPalettes.lightGreen,),
                            child: Checkbox(
                              activeColor: ColorPalettes.lightGreen,
                              value: isFridayChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isFridayChecked = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                            child: Text(
                                AppLocalizations.of(context).translate('friday'),
                                style: TextStyle(
                                    color: ColorPalettes.textColorBlack,
                                    fontFamily: 'Golos',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButtonWhiteStroke(
                          text: fridayStartTime??'00:00',
                          isValueEntered: fridayStartTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                fridayStartTime = result.format(context);
                              });
                            }
                          },
                        ),
                        Text(' - ',
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )),
                        CustomButtonWhiteStroke(
                          text: fridayEndTime??'00:00',
                          isValueEntered: fridayEndTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                fridayEndTime = result.format(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ])
          ),
          Container(
              width: Sizes.width(context) * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: ColorPalettes.lightGreen,),
                            child: Checkbox(
                              activeColor: ColorPalettes.lightGreen,
                              value: isSaturdayChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isSaturdayChecked = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                            child: Text(
                                AppLocalizations.of(context).translate('saturday'),
                                style: TextStyle(
                                    color: ColorPalettes.textColorBlack,
                                    fontFamily: 'Golos',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButtonWhiteStroke(
                          text: saturdayStartTime??'00:00',
                          isValueEntered: saturdayStartTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                saturdayStartTime = result.format(context);
                              });
                            }
                          },
                        ),
                        Text(' - ',
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )),
                        CustomButtonWhiteStroke(
                          text: saturdayEndTime??'00:00',
                          isValueEntered: saturdayEndTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                saturdayEndTime = result.format(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ])
          ),
          Container(
              width: Sizes.width(context) * .9,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: Theme.of(context).copyWith(unselectedWidgetColor: ColorPalettes.lightGreen,),
                            child: Checkbox(
                              activeColor: ColorPalettes.lightGreen,
                              value: isSundayChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  isSundayChecked = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                            child: Text(
                                AppLocalizations.of(context).translate('sunday'),
                                style: TextStyle(
                                    color: ColorPalettes.textColorBlack,
                                    fontFamily: 'Golos',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400
                                )),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButtonWhiteStroke(
                          text: sundayStartTime??'00:00',
                          isValueEntered: sundayStartTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                sundayStartTime = result.format(context);
                              });
                            }
                          },
                        ),
                        Text(' - ',
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                            )),
                        CustomButtonWhiteStroke(
                          text: sundayEndTime??'00:00',
                          isValueEntered: sundayEndTime != null ? true : false,
                          onPressed: () async {
                            final TimeOfDay result = await  showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, _) {
                                  return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                      child: _);
                                });
                            if (result != null) {
                              setState(() {
                                sundayEndTime = result.format(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ])
          ),
          SizedBox(height: 40),
          CustomButton(
            text: AppLocalizations.of(context).translate('toAdd'),
            onPressed: () {
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


}
