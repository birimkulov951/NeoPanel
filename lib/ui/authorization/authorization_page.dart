import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/authorization/password_recovery_page.dart';
import 'package:neopanel/ui/main_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthorizationPage extends StatefulWidget {
  static const routeName = "/authorizationPage";

  const AuthorizationPage({Key key}) : super(key: key);

  _AuthorizationPage createState() => _AuthorizationPage();
}

class _AuthorizationPage extends State<AuthorizationPage> {

  final regExpEmail = RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$");
  final regExpPassword = RegExp("(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}");

  String validateEmail(String value) {
    if (emailController.text.length > 5) {
      if (!regExpEmail.hasMatch(value)) {
        isButtonClickable = false;
        return emailControllerText;
      } else {
        isButtonClickable = true;
        return null;
      }
    }
    isButtonClickable = true;
    return null;
  }
  String validatePassword(String value) {
    if (passwordController.text.length > 7) {
      if (!regExpPassword.hasMatch(value)) {
        isButtonClickable = false;
        return passwordControllerText;
      } else {
        isButtonClickable = true;
        return null;
      }
    }
    isButtonClickable = true;
    return null;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonClickable = false;
  String emailControllerText;
  String passwordControllerText;

  bool isRememberMeChecked = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalettes.white,
        body: SafeArea(
          child: _formLogin(context)
        )
    );
  }

  Widget _formLogin(BuildContext context) {
    emailControllerText = AppLocalizations.of(context).translate('invalidEmailFormat');
    passwordControllerText = AppLocalizations.of(context).translate('invalidPasswordFormat');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                AppLocalizations.of(context).translate('authorization'),
                style: TextStyle(
                    color: ColorPalettes.textColorBlack,
                    fontFamily: 'Golos',
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 40),
              CustomText(
                  text: AppLocalizations.of(context).translate('specifyEmail'),
                  isRequiredField: false),
              SizedBox(height: 10),
              CustomTextField(
                validator: validateEmail,
                textEditingController: emailController,
                onChanged: (text) {setState(() {});},
                text: AppLocalizations.of(context).translate('email'),
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              SizedBox(height: 20),
              CustomText(
                  text: AppLocalizations.of(context)
                      .translate('specifyPassword'),
                  isRequiredField: false),
              SizedBox(height: 10),
              CustomTextField(
                validator: validatePassword,
                textEditingController: passwordController,
                onChanged: (text) {setState(() {});},
                text: AppLocalizations.of(context).translate('password'),
                keyboardType: TextInputType.visiblePassword,
                maxLines: 1,),
              /*Visibility(
          visible: isAlertMessageVisible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    alertMessage ?? AppLocalizations.of(context).translate('emailOrPasswordEnteredIncorrectly'),
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Golos',
                        fontSize: 13),
                  )
              ),
            ],
          ),
        ),*/
              SizedBox(height: 6),
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
                                data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: ColorPalettes.lightGreen,
                                ),
                                child: Checkbox(
                                  activeColor: ColorPalettes.lightGreen,
                                  value: isRememberMeChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isRememberMeChecked = !isRememberMeChecked;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                                child: Text(
                                    AppLocalizations.of(context).translate(
                                        'rememberMe'),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Golos',
                                      fontSize: 13,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppLocalizations.of(context).translate('forgotYourPassword'),
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontFamily: 'Golos',
                                    fontSize: 13,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigation.intent(context, PasswordRecoveryPage.routeName);
                                    }),
                            ],
                          ),
                        ),
                      ])
              ),
              SizedBox(height: 20),
              BlocBuilder<AuthorizationBloc, AuthorizationState>(
                builder: (context, state) {
                  if (state is AuthorizationHasData) {
                    context.read<AuthorizationBloc>().add(AuthorizationStateChange(emailController.text.toString(),passwordController.text.toString(),isRememberMeChecked));
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if(passwordController.text.length > 7 && emailController.text.length > 0) {
                        Navigation.intentWithClearAllRoutes(context, MainPage.routeName);
                      }
                    });
                  }
                  if (state is AuthorizationNoData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('unknownError'));
                    });
                  }
                  if (state is AuthorizationNoInternetConnection) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(context: context, builder: (context) =>
                          CustomDialogNotification(
                              title: AppLocalizations.of(context).translate('authorisationError'),
                              subTitle: AppLocalizations.of(context).translate('tryToCheckInternetAlert'),
                              onPressed: () {
                                Navigator.pop(context);
                              }));
                      context.read<AuthorizationBloc>().add(AuthorizationStateChange(emailController.text.toString(),passwordController.text.toString(),isRememberMeChecked));
                    });
                  }
                  if (state is AuthorizationError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(context: context, builder: (context) =>
                          CustomDialogNotification(
                              title: AppLocalizations.of(context).translate('authorisationError'),
                              subTitle: AppLocalizations.of(context).translate('invalidMailOrPassword'),
                              onPressed: () {
                                Navigator.pop(context);
                              }));
                      context.read<AuthorizationBloc>().add(AuthorizationStateChange(emailController.text.toString(),passwordController.text.toString(),isRememberMeChecked));
                    });
                  }
                  if(state is AuthorizationLoading || state is AuthorizationHasData) {

                    return LoadingIndicator();

                  } else {
                    return  CustomButton(
                        text: AppLocalizations.of(context).translate('entrance'),
                        isClickable: emailController.text.length > 5 && passwordController.text.length > 7 ? true : false,
                        onPressed: () {
                          context.read<AuthorizationBloc>().add(AuthorizationAuthorize(emailController.text.toString()/*.replaceAll(' ', '')*/,passwordController.text.toString(),isRememberMeChecked));
                        }
                    );
                  }
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        )
      ],
    );
  }




  /*Widget buttonLogin() {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: (context, state) {
        if (state == AuthorizationHasData) {
          print('state = $state');
          Navigation.intent(context, MainPage.routeName);
          // SchedulerBinding.instance.addPostFrameCallback((_) {
          //   Navigator.of(context).pushNamed(MainPage.routeName);
          // });

        }

        if (state.toString() == 'AuthorizationNoInternetConnection') {
          print('State = $state');
          _showAlertMessage(AppLocalizations.of(context).translate('noInternetConnection'));

        }
        if (state.toString() == 'AuthorizationError') {
          print('State = $state');

          showDialog(context: context, builder: (context) =>
              CustomDialogNotification(
                  title: AppLocalizations.of(context).translate('authorisationError'),
                  subTitle: AppLocalizations.of(context).translate('tryToCheckInternetAlert'),
                  onPressed: () {
                    Navigator.pop(context);
                  }));

        }
        if(state.toString() == 'AuthorizationLoading') {
          print('state = $state');

          return Center(
              child: LoadingIndicator()
          );
        } else {
          print('State = ELSE');
          return CustomButton(
              text: AppLocalizations.of(context).translate('entrance'),
              isClickable: true,
              onPressed: () {
                context.read<AuthorizationBloc>().add(AuthorizationAuthorize(emailController.text.toString(),passwordController.text.toString(),isRememberMeChecked));
              }
          );
        }
      },
    );
  }*/

}
