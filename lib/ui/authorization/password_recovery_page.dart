import 'package:shared/shared.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PasswordRecoveryPage extends StatefulWidget {
  static const routeName = "/passwordRecoveryPage";

  const PasswordRecoveryPage({Key key}) : super(key: key);

  _PasswordRecoveryPage createState() => _PasswordRecoveryPage();
}

class _PasswordRecoveryPage extends State<PasswordRecoveryPage> {

  final regExpEmail = RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$");

  String validateEmail(String value) {
    if (emailController.text.length > 5) {
      if (!regExpEmail.hasMatch(value)) {
        return emailControllerText;
      } else {
        return null;
      }
    }
    return null;
  }

  final emailController = TextEditingController();
  String emailControllerText;


  @override
  void initState() {
    context.read<PasswordRecoveryBloc>().add(PasswordRecoveryStateChange());
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalettes.white,
        body: SafeArea(
          child:_formLogin()),
    );
  }

  Widget _formLogin() {
    emailControllerText = AppLocalizations.of(context).translate('invalidEmailFormat');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  AppLocalizations.of(context).translate('passwordRecovery'),
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
                  text: AppLocalizations.of(context).translate('email'),
                  keyboardType: TextInputType.emailAddress,
                  //onChanged: (text) {setState(() {});},
                  maxLines: 1,),
                SizedBox(height: 40),
                BlocBuilder<PasswordRecoveryBloc, PasswordRecoveryState>(
                  builder: (context, state) {
                    print('State is $state');
                    if (state is PasswordRecoveryForgotPasswordHasData) {
                      print('Recovery code generated successfully');
                    }
                    if (state is PasswordRecoveryNewPasswordHasData) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(context: context, builder: (context) =>
                            CustomDialogNotification(
                                subTitle: AppLocalizations.of(context).translate('newPasswordHaveBeenGenerated'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }));
                        Navigator.pop(context);
                      });
                    }
                    if (state is PasswordRecoveryNoData) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('passwordGenerationError'));
                        context.read<PasswordRecoveryBloc>().add(PasswordRecoveryStateChange());
                      });
                    }
                    if (state is PasswordRecoveryNoInternetConnection) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('noInternetConnection'));
                      });
                    }
                    if (state is PasswordRecoveryError) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('unknownError'));
                        context.read<PasswordRecoveryBloc>().add(PasswordRecoveryStateChange());
                      });
                    }

                    if(state is PasswordRecoveryLoading) {
                      return Center(
                          child: CircularProgressIndicator()
                      );
                    } else {
                      return CustomButton(
                          text: AppLocalizations.of(context)
                              .translate('entrance'),
                          isClickable: emailController.text.length > 5 ? true: false,
                          onPressed: () {
                            context.read<PasswordRecoveryBloc>().add(GenerateNewPasswordTwo(0,emailController.text));
                          }
                      );
                    }
                  },
                ),
                SizedBox(height: 40),
              ],
            )
        ),
      ],
    );
  }

}
