import 'package:shared/shared.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';

class CourseFormPage extends StatefulWidget {
  static const routeName = "/courseFormPage";

  const CourseFormPage({Key key}) : super(key: key);

  _CourseFormPage createState() => _CourseFormPage();
}

class _CourseFormPage extends State<CourseFormPage> {

  // create some values
  Color pickerColor = ColorPalettes.white;
  Color currentColor = ColorPalettes.darkPrimary;


  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
    CustomToast.showCustomToast(context, '$pickerColor');
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
            ]
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
        AppLocalizations.of(context).translate('addingCourse'),
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
            AppLocalizations.of(context).translate('timeToExpand'),
            style: TextStyle(
                fontFamily: 'Golos',
                color: ColorPalettes.textColorBlack,
                fontSize: 21,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 18),
          Text(
            AppLocalizations.of(context).translate('detailsMessage'),
            style: TextStyle(
                fontFamily: 'Golos',
                color: ColorPalettes.textColorBlack,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 25),
          CustomText(
              text: AppLocalizations.of(context).translate('name2')),
          SizedBox(height: 10),
          CustomTextField(
            keyboardType: TextInputType.name,
            maxLines: 1,
          ),
          SizedBox(height: 20),
          CustomText(text: AppLocalizations.of(context).translate('chooseColor')),
          SizedBox(height: 10),
          Container(
            width: Sizes.width(context) * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(IconAssets.paintIcon),
                SizedBox(width: 13),
                RaisedButton(
                  elevation: 0,
                  color: pickerColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: ColorPalettes.greyStroke,
                    ),
                    borderRadius: BorderRadius.circular(
                      Sizes.dp6(context),
                    ),
                  ),
                  onPressed: () {
                    CustomToast.showCustomToast(context, "show color picker");
                    // raise the [showDialog] widget
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          titlePadding: const EdgeInsets.all(0.0),
                          contentPadding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          content: SingleChildScrollView(
                            child: SlidePicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                              paletteType: PaletteType.rgb,
                              enableAlpha: false,
                              displayThumbColor: true,
                              showLabel: false,
                              showIndicator: true,
                              indicatorBorderRadius:
                              const BorderRadius.vertical(
                                top: const Radius.circular(8),
                                bottom: const Radius.circular(8),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            )
          ),
          SizedBox(height: 40),
          CustomButton(
            text: AppLocalizations.of(context).translate('create'),
            onPressed: () {
              CustomToast.showCustomToast(context, "Course created");
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


}
