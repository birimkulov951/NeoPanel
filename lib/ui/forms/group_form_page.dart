import 'package:shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class GroupFormPage extends StatefulWidget {
  static const routeName = "/groupFormPage";

  const GroupFormPage({Key key}) : super(key: key);

  _GroupFormPage createState() => _GroupFormPage();
}

class _GroupFormPage extends State<GroupFormPage> {
  String _valueChooseCourse;
  List _listOfCourses = ['PHP', 'Java', 'Swift'];

  String _valueChooseCity;
  List _listOfCities = ['Bishkek', 'Astana', 'Tashkent'];

  String _valueChooseTeacher;
  List _listOfTeachers = ['Dimash', 'Nodir', 'Farida'];

  //String _valueChooseMonth;
  //List _listOfMonths = ['1','2','3','4','5','6','7','8','9','10','11','12'];

  FocusNode nameNode;
  FocusNode numberOfPaymentColumnsNode;
  FocusNode maxStudentsNumberNode;
  FocusNode monthPriceNode;

  DateTime currentTime = DateTime.now();
  DateTime responseStartDate;
  DateTime responseEndDate;
  String selectedStartDate;
  String selectedEndDate;

  @override
  void initState() {
    super.initState();
    nameNode = FocusNode();
    numberOfPaymentColumnsNode = FocusNode();
    maxStudentsNumberNode = FocusNode();
    monthPriceNode = FocusNode();
  }

  @override
  void dispose() {
    nameNode.dispose();
    numberOfPaymentColumnsNode.dispose();
    maxStudentsNumberNode.dispose();
    monthPriceNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(context),
        body: Center(
          child: SingleChildScrollView(child: _form(context)),
        ));
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
        AppLocalizations.of(context).translate('addingGroup'),
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
            child: Text(
              AppLocalizations.of(context).translate('systemInfo'),
              style: TextStyle(
                  fontFamily: 'Golos',
                  color: ColorPalettes.textColorBlack,
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 25),
          CustomText(text: AppLocalizations.of(context).translate('course')),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChooseCourse,
            listItems: _listOfCourses,
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('name2')),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: nameNode,
            keyboardType: TextInputType.name,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('city')),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChooseCity,
            listItems: _listOfCities,
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
                          fontWeight: FontWeight.w500)),
                  CustomButtonPurpleStroke(
                    text: selectedStartDate ?? '01.01.2017',
                    //'${startPeriodDate.day??'01'}.${startPeriodDate.month??'01'}.${startPeriodDate.year??'2000'}',
                    isValueEntered: selectedStartDate != null ? true : false,
                    onPressed: () async {
                      responseStartDate = await showDatePicker(
                          context: context,
                          initialDate: currentTime,
                          firstDate: DateTime(2017, 1, 1),
                          lastDate: DateTime(2037, 1, 1));
                      if (responseStartDate != null &&
                          responseStartDate != currentTime)
                        setState(() {
                          selectedStartDate =
                              '${responseStartDate.day}.${responseStartDate.month}.${responseStartDate.year}';
                        });
                    },
                  ),
                  Text(AppLocalizations.of(context).translate('until'),
                      style: TextStyle(
                          color: ColorPalettes.textColorGrey,
                          fontFamily: 'Golos',
                          fontSize: 13,
                          fontWeight: FontWeight.w500)),
                  CustomButtonPurpleStroke(
                    text: selectedEndDate ?? '01.01.2037',
                    isValueEntered: selectedEndDate != null ? true : false,
                    onPressed: () async {
                      responseEndDate = await showDatePicker(
                          context: context,
                          initialDate: currentTime,
                          firstDate: DateTime(2017, 1, 1),
                          lastDate: DateTime(2027, 1, 1));
                      if (responseEndDate != null &&
                          responseEndDate != currentTime)
                        setState(() {
                          selectedEndDate =
                              '${responseEndDate.day}.${responseEndDate.month}.${responseEndDate.year}';
                        });
                    },
                  ),
                ],
              )),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('teacher')),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChooseTeacher,
            listItems: _listOfTeachers,
          ),
          SizedBox(height: 20),
          CustomText(
              text: AppLocalizations.of(context)
                  .translate('numberOfPaymentColumns')),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: numberOfPaymentColumnsNode,
            keyboardType: TextInputType.name,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 20),
          CustomText(
            text: AppLocalizations.of(context).translate('maxStudentsNumber'),
            isRequiredField: false,
          ),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: maxStudentsNumberNode,
            keyboardType: TextInputType.name,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 20),
          CustomText(
              text: AppLocalizations.of(context).translate('monthPrice')),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: monthPriceNode,
            keyboardType: TextInputType.number,
            maxLines: 1,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
          ),
          SizedBox(height: 40),
          CustomButton(
            text: AppLocalizations.of(context).translate('toAdd'),
            onPressed: () {},
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
