import 'package:shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class EmployeeFormPage extends StatefulWidget {
  static const routeName = "/employeeFormPage";

  const EmployeeFormPage({Key key}) : super(key: key);

  _EmployeeFormPage createState() => _EmployeeFormPage();
}

class _EmployeeFormPage extends State<EmployeeFormPage> {

  final employeeEmail = TextEditingController();

  String _valueChoosePosition;
  List _listOfPositions = ['SuperAdmin','Admin','SMM Agent'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: _form(context),
            )
          ]
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
        AppLocalizations.of(context).translate('addingAnUser'),
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
          Text(
            AppLocalizations.of(context).translate('weHaveReplenishment'),
            style: TextStyle(
                fontFamily: 'Golos',
                color: ColorPalettes.textColorBlack,
                fontSize: 21,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 18),
          Container(
            width: Sizes.width(context) * .9,
            child: Center(
              child: Text(
                AppLocalizations.of(context).translate('newEmployeeMessage'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Golos',
                    color: ColorPalettes.textColorBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 25),
          CustomText(
              text: AppLocalizations.of(context).translate('email'),
              isRequiredField: true),
          SizedBox(height: 10),
          CustomTextField(
              textEditingController: employeeEmail,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1
          ),
          SizedBox(height: 20),
          CustomText(
              text: AppLocalizations.of(context).translate('position'),
              isRequiredField: true),
          SizedBox(height: 10),
          CustomDropdownButton(
            hintText: '',
            value: _valueChoosePosition,
            listItems: _listOfPositions,
          ),
          SizedBox(height: 40),
          CustomButton(
            text: AppLocalizations.of(context).translate('send'),
            onPressed: () {
              CustomToast.showCustomToast(context, "Email sent!!!");
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


}
