import 'package:shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ColumnFormPage extends StatefulWidget {
  static const routeName = "/columnFormPage";

  const ColumnFormPage({Key key}) : super(key: key);

  _ColumnFormPage createState() => _ColumnFormPage();
}

class _ColumnFormPage extends State<ColumnFormPage> {

  final TextEditingController nameController = TextEditingController();
  //String nameControllerText;


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
        AppLocalizations.of(context).translate('addingColumn'),
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
                color: ColorPalettes.textColorBlack,
                fontFamily: 'Golos',
                fontSize: 21,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 25),
          CustomText(
              text: AppLocalizations.of(context).translate('name2')),
          SizedBox(height: 10),
          CustomTextField(
            textEditingController: nameController,
            onChanged: (text) {setState(() {});},
            keyboardType: TextInputType.name,
            maxLines: 1,
          ),
          SizedBox(height: 40),
          CustomButton(
            text: AppLocalizations.of(context).translate('toAdd'),
            isClickable: nameController.text.length > 0,
            onPressed: () {
              CustomToast.showCustomToast(context, "Column added");
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


}
