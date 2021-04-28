import 'package:shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ClientFormPage extends StatefulWidget {
  static const routeName = "/clientFormPage";

  const ClientFormPage({Key key}) : super(key: key);

  _ClientFormPage createState() => _ClientFormPage();
}

class _ClientFormPage extends State<ClientFormPage> {

  int _radioButtonValue = 1;

  // Ostatok
  int _paymentRemainder = 0;

  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  FocusNode surnameNode;
  FocusNode nameNode;
  FocusNode middleNameNode;
  FocusNode emailNode;
  FocusNode phoneNode;
  FocusNode prePaymentNode;
  FocusNode commentNode;

  String _valueChooseCity;
  List _listOfCities = ['Talas','Bishkek','London'];

  String _valueChooseResource;
  List _listOfResources = ['Instagramm','facebook','friend'];

  String _valueChooseStatus;
  List _listOfStatuses = ['First contact','thinking','called'];

  String _valueChooseCourse;
  List _listOfCourses = ['PHP','Java','Swift'];

  String _valueChooseGroup;
  List _listOfGroups = ['PM','Flutter','Design'];

  @override
  void initState() {
    super.initState();
    surnameNode = FocusNode();
    nameNode = FocusNode();
    middleNameNode = FocusNode();
    emailNode = FocusNode();
    phoneNode = FocusNode();
    prePaymentNode = FocusNode();
    commentNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    surnameNode.dispose();
    nameNode.dispose();
    middleNameNode.dispose();
    emailNode.dispose();
    phoneNode.dispose();
    prePaymentNode.dispose();
    commentNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Center(
        child: SingleChildScrollView(
            child: _formAddition()),
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
        AppLocalizations.of(context).translate('requestTitleForForm'),
          style: TextStyle(
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w500),
      ),
      centerTitle: false,
    );
  }

  Widget _formAddition() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            width: Sizes.width(context) * .9,
            child: Text(
              AppLocalizations.of(context).translate('privateInfo'),
              style: TextStyle(
                  fontFamily: 'Golos',
                  color: ColorPalettes.textColorBlack,
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 25),
          CustomText(text: AppLocalizations.of(context).translate('surname'),
          ),
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
          CustomText(text: AppLocalizations.of(context).translate('middleName'), isRequiredField: false,),
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
                  fontFamily: 'Golos',
                  color: ColorPalettes.textColorBlack,
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
            onEditingComplete: () => FocusScope.of(context).requestFocus(commentNode),
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
          CustomText(text: AppLocalizations.of(context).translate('howDidYouKnowAboutUs')),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChooseResource,
            listItems: _listOfResources,
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('course')),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChooseCourse,
            listItems: _listOfCourses,
          ),
          SizedBox(height: 20),
          CustomText(
            text: AppLocalizations.of(context).translate('laptop'),isRequiredField: false,),
          SizedBox(height: 5),
          Padding(
              padding: EdgeInsets.only(left: 5),
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: ColorPalettes.radioGreyColor,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioButtonValue,
                      onChanged: (value) {
                        setState(() {
                          _radioButtonValue = value;
                        });
                      },
                      activeColor: ColorPalettes.deepPurple,
                      focusColor: ColorPalettes.deepPurple,
                      hoverColor: ColorPalettes.textColorGrey,

                    ),
                    Text(AppLocalizations.of(context).translate('yes'),
                      style: TextStyle(
                          fontFamily: 'Golos',
                          color: ColorPalettes.textColorBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),),
                    Radio(
                      value: 2,
                      groupValue: _radioButtonValue,
                      onChanged: (value) {
                        setState(() {
                          _radioButtonValue = value;
                        });
                      },
                      activeColor: ColorPalettes.deepPurple,
                      focusColor: ColorPalettes.deepPurple,
                    ),
                    Text(AppLocalizations.of(context).translate('no'),
                      style: TextStyle(
                          fontFamily: 'Golos',
                          color: ColorPalettes.textColorBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),)
                  ],
                ),
              )
          ),
          SizedBox(height: 10),
          CustomText(text: AppLocalizations.of(context).translate('comment'), isRequiredField: false),
          SizedBox(height: 10),
          CustomTextField(
            focusNode: commentNode,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          SizedBox(height: 40),
          CustomButton(
            text: AppLocalizations.of(context).translate('toAdd'),
            onPressed: () {

            },
          ),
          SizedBox(height: 20),
          CustomButtonWhite(
            text: AppLocalizations.of(context).translate('toStudentApplication'),
            isClickable: true,
            onPressed: () {

            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


}
