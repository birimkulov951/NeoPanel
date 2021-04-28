import 'package:shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class CityFormPage extends StatefulWidget {
  static const routeName = "/cityFormPage";

  const CityFormPage({Key key}) : super(key: key);

  _CityFormPage createState() => _CityFormPage();
}

class _CityFormPage extends State<CityFormPage> {

  final TextEditingController nameController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(context),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
              child: _form(context)),
        ],
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
        AppLocalizations.of(context).translate('addingCity2'),
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
            AppLocalizations.of(context).translate('howToCall'),
            style: TextStyle(
                fontFamily: 'Golos',
                color: ColorPalettes.textColorBlack,
                fontSize: 21,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 25),
          CustomText(
              text: AppLocalizations.of(context).translate('name2')),
          SizedBox(height: 10),
          CustomTextField(
            keyboardType: TextInputType.name,
            maxLines: 1,
          ),
          SizedBox(height: 40),
          CustomButton(
            text: AppLocalizations.of(context).translate('toAdd'),
            isClickable: nameController.text.length > 0,
            onPressed: () {
              CustomToast.showCustomToast(context, "City added");
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


}
