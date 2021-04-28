import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FailureLeadPage extends StatefulWidget {
  static const routeName = "/failureLeadPage";

  const FailureLeadPage({Key key}) : super(key: key);

  _FailureLeadPage createState() => _FailureLeadPage();
}

class _FailureLeadPage extends State<FailureLeadPage> {

  TextStyle radioStyle = TextStyle(
      fontFamily: 'Golos',
      color: ColorPalettes.textColorBlack,
      fontSize: 15,
      fontWeight: FontWeight.w400);

  int clientId;

  int _radioButtonValue = 0;


  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      print(arguments[AppConstants.CLIENT_ID]);
      clientId = arguments[AppConstants.CLIENT_ID];
    }
    return Scaffold(
      appBar: _getAppBar(context),
      body: SingleChildScrollView(
          child: _form(context)),
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
        AppLocalizations.of(context).translate('dealFailed'),
        style: TextStyle(
            color: ColorPalettes.textColorBlack,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Container(
              width: Sizes.width(context) * .9,
              child: Text(
                AppLocalizations.of(context).translate('whyFailure'),
                style: TextStyle(
                    color: ColorPalettes.textColorBlack,
                    fontFamily: 'Golos',
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              )
          ),

          SizedBox(height: 18),
          Container(
              width: Sizes.width(context) * .9,
              child: Text(
                AppLocalizations.of(context).translate('failureReason'),
                style: TextStyle(
                    color: ColorPalettes.textColorBlack,
                    fontFamily: 'Golos',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )
          ),
          SizedBox(height: 10),
          Row(
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
              Text(AppLocalizations.of(context).translate('financialDifficulties'), style: radioStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
                hoverColor: ColorPalettes.textColorGrey,
              ),
              Text(AppLocalizations.of(context).translate('personalProblems'), style: radioStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 3,
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
              Text(AppLocalizations.of(context).translate('familyProblems'), style: radioStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 4,
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
              Text(AppLocalizations.of(context).translate('unknown'), style: radioStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 5,
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
              Text(AppLocalizations.of(context).translate('doesNotWantToWait'), style: radioStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 6,
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
              Text(AppLocalizations.of(context).translate('other'), style: radioStyle),
            ],
          ),
          Visibility(
            visible: _radioButtonValue == 6 ? true : false,
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                ),
              ],
            )
          ),
          SizedBox(height: 40),
          BlocBuilder<FailureLeadBloc, FailureLeadState>(
            builder: (context, state) {

              if (state is FailureLeadHasData) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('saved'));
                  Navigation.intentWithClearAllRoutes(context, MainPage.routeName);
                });
              }
              if (state is FailureLeadNoData) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('unknownError'));
                });
              }
              if (state is FailureLeadNoInternetConnection) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('noInternetConnection'));
                });
              }
              if (state is FailureLeadError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('unknownError'));
                });
              }
              if (state is FailureLeadLoading) {

                return LoadingIndicator();

              } else {

                return CustomButton(
                  text: AppLocalizations.of(context).translate('toSave'),
                  isClickable: _radioButtonValue != 0,
                  onPressed: () {
                    //context.read<FailureLeadBloc>().add(SubmitLeadFailure(fefefe));
                  },
                );
              }
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


}
