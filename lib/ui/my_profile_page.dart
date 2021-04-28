import 'package:neopanel/ui/authorization/authorization_page.dart';
import 'package:shared/shared.dart';
import 'package:core/core.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyProfilePage extends StatefulWidget {
  static const routeName = "/myProfilePage";

  const MyProfilePage({Key key}) : super(key: key);

  _MyProfilePage createState() => _MyProfilePage();
}

class _MyProfilePage extends State<MyProfilePage> {
  final regExpEmail = RegExp(
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\$");
  bool isProgressBarVisible = false;
  String emailControllerText;

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

  FocusNode surnameNode;
  FocusNode nameNode;
  FocusNode middleNameNode;
  FocusNode emailNode;
  FocusNode phoneNode;
  FocusNode citiesNode;

  String circleAvatarLetter;
  int id;
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String _valueChooseCity;
  int cityId;
  List _listOfCities = [];
  List _listOfCityIds = [];

  @override
  void initState() {
    context.read<CurrentUserBloc>().add(GetCurrentUser());
    surnameNode = FocusNode();
    nameNode = FocusNode();
    middleNameNode = FocusNode();
    emailNode = FocusNode();
    phoneNode = FocusNode();
    citiesNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    surnameNode.dispose();
    nameNode.dispose();
    middleNameNode.dispose();
    emailNode.dispose();
    phoneNode.dispose();
    citiesNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.white,
      appBar: _getAppBar(context),
      body: SingleChildScrollView(child: _myProfile()),
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
        AppLocalizations.of(context).translate('myProfile'),
        style: TextStyle(
            color: ColorPalettes.textColorBlack,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w500),
      ),
      centerTitle: false,
    );
  }

  Widget _myProfile() {
    emailControllerText =
        AppLocalizations.of(context).translate('invalidEmailFormat');
    return Form(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40),
              CircleAvatar(
                  minRadius: 40,
                  backgroundColor: ColorPalettes.iconGreen,
                  child: Text(
                    circleAvatarLetter ?? '',
                    style: TextStyle(
                        fontFamily: 'Golos',
                        color: ColorPalettes.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(height: 40),
              Container(
                width: Sizes.width(context) * .9,
                child: Text(
                  AppLocalizations.of(context).translate('privateInfo'),
                  style: TextStyle(
                      color: ColorPalettes.textColorBlack,
                      fontFamily: 'Golos',
                      fontSize: 21,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 25),
              CustomText(
                text: AppLocalizations.of(context).translate('surname'),
              ),
              SizedBox(height: 10),
              CustomTextField(
                textEditingController: surnameController,
                onChanged: (text) {
                  setState(() {});
                },
                maxLines: 1,
                focusNode: surnameNode,
                keyboardType: TextInputType.name,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(height: 20),
              CustomText(text: AppLocalizations.of(context).translate('name')),
              SizedBox(height: 10),
              CustomTextField(
                textEditingController: nameController,
                onChanged: (text) {
                  setState(() {});
                },
                focusNode: nameNode,
                keyboardType: TextInputType.name,
                maxLines: 1,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(height: 20),
              CustomText(
                  text: AppLocalizations.of(context).translate('middleName'),
                  isRequiredField: false),
              SizedBox(height: 10),
              CustomTextField(
                textEditingController: middleNameController,
                onChanged: (text) {
                  setState(() {});
                },
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
              CustomText(
                  text: AppLocalizations.of(context).translate('email'),
                  isRequiredField: true),
              SizedBox(height: 10),
              CustomTextField(
                validator: validateEmail,
                textEditingController: emailController,
                onChanged: (text) {
                  setState(() {});
                },
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                focusNode: emailNode,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(height: 20),
              CustomText(text: AppLocalizations.of(context).translate('phone')),
              SizedBox(height: 10),
              CustomTextField(
                textEditingController: phoneController,
                onChanged: (text) {
                  setState(() {});
                },
                focusNode: phoneNode,
                keyboardType: TextInputType.phone,
                maxLines: 1,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(citiesNode),
              ),
              SizedBox(height: 20),
              CustomText(text: AppLocalizations.of(context).translate('city')),
              SizedBox(height: 10),
              CustomDropdownButton(
                //focusNode: citiesNode,
                hintText: '',
                value: _valueChooseCity,
                listItems: _listOfCities,
                onChanged: (newValue) {
                  setState(() {
                    _valueChooseCity = newValue;
                    //cityId = _listOfCityIds[_listOfCities.indexOf(_valueChooseCity)];
                  });
                },
              ),
              SizedBox(height: 40),
              _saveChangesButton(context),
              SizedBox(height: 80),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: AppLocalizations.of(context)
                            .translate('exitProfile'),
                        style: TextStyle(
                            color: ColorPalettes.deepPurple,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialogAlert(
                                    title: AppLocalizations.of(context)
                                        .translate('alreadyLeaving'),
                                    subTitle: AppLocalizations.of(context)
                                        .translate('exitSystem'),
                                    onNegative: () {
                                      Navigator.pop(context);
                                    },
                                    onPositive: () {
                                      //CustomToast.showCustomToast(context, 'Positive clicked');
                                      Navigation.intentWithClearAllRoutes(
                                          context, AuthorizationPage.routeName);
                                    }));
                          }),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Text(
                '${AppLocalizations.of(context).translate('registered')} 23.04.2021',
                style: TextStyle(
                    height: 1.5,
                    fontFamily: 'Golos',
                    color: ColorPalettes.textColorGrey,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
            ],
          ),
          Positioned(
              top: 0,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final offsetAnimation = Tween<Offset>(
                            begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
                        .animate(animation);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  child: isProgressBarVisible
                      ? LinearLoadingIndicator()
                      : SizedBox())),
        ],
      ),
    );
  }

  Widget _saveChangesButton(BuildContext context) {
    return BlocBuilder<CurrentUserBloc, CurrentUserState>(
      builder: (context, state) {
        print('State is $state');
        if (state is CurrentUserHasData) {
          if (id == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              id = state.currentUserResult.id;
              surnameController.text = state.currentUserResult.surname;
              nameController.text = state.currentUserResult.name;
              middleNameController.text = state.currentUserResult.middleName;
              emailController.text = state.currentUserResult.email;
              phoneController.text = state.currentUserResult.phoneNumber;
              _valueChooseCity = state.currentUserResult.cityName;
              circleAvatarLetter = state.currentUserResult.name[0];
              context.read<CurrentUserBloc>().add(GetCitiesForMyProfile());
            });
          }
        }
        if (state is CurrentUserError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('unknownError'));
            context.read<CurrentUserBloc>().add(CurrentUserStateChange());
          });
        }

        if (state is UpdateUserNoData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('noDataAvailable'));
            context.read<CurrentUserBloc>().add(CurrentUserStateChange());
          });
        }
        if (state is UpdateUserHasData) {

          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('changesSaved'));
            context.read<CurrentUserBloc>().add(CurrentUserStateChange());
          });
        }
        if (state is UpdateUserNoInternetConnection) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('noInternetConnection'));
            context.read<CurrentUserBloc>().add(CurrentUserStateChange());
          });
        }
        if (state is UpdateUserError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('unknownError'));
            context.read<CurrentUserBloc>().add(CurrentUserStateChange());
          });
        }

        if (state is CitiesForMyProfileLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showProgressBar();
          });
        }
        if (state is CitiesForMyProfileHasData) {
          if (_listOfCities.isEmpty) {
            //_listOfCities.clear();
            //_listOfCityIds.clear();
            for (int i = 0; i < state.citiesResult.results.length; i++) {
              _listOfCities.add(state.citiesResult.results[i].name.toString());
              _listOfCityIds.add(state.citiesResult.results[i].id.toInt());
            }
          }

          cityId = _listOfCityIds[_listOfCities.indexOf(_valueChooseCity)];

          print(
              'City  $cityId $id $_valueChooseCity ${state.citiesResult.results.length}');

          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            context.read<CurrentUserBloc>().add(CurrentUserStateChange());
          });
        }

        if (state is CitiesForMyProfileError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context,
                AppLocalizations.of(context).translate('unknownError'));
            context.read<CurrentUserBloc>().add(CurrentUserStateChange());
          });
        }

        if (state is UpdateUserLoading) {
          return LoadingIndicator();
        } else {
          return CustomButton(
            text: AppLocalizations.of(context).translate('saveChanges'),
            isClickable: surnameController.text.length > 0 &&
                    nameController.text.length > 0 &&
                    phoneController.text.length > 0 &&
                    emailController.text.length > 0
                //id != null && cityId != null
                ? true
                : false,
            onPressed: () {
              print("Datassssss $id ${surnameController.text}, "
                  "${nameController.text},"
                  " ${middleNameController.text},"
                  "$cityId,"
                  "${phoneController.text},"
                  "${emailController.text}");
              context.read<CurrentUserBloc>().add(UpdateCurrentUserTwo(
                  id,
                  " ",
                  surnameController.text.toString(),
                  nameController.text.toString(),
                  middleNameController.text.toString(),
                  cityId,
                  phoneController.text.toString(),
                  emailController.text.toString()));
            },
          );
        }
      },
    );
  }

  void showProgressBar() {
    if (!isProgressBarVisible) {
      setState(() {
        isProgressBarVisible = true;
      });
    }
  }

  void hideProgressBar() {
    if (isProgressBarVisible) {
      setState(() {
        isProgressBarVisible = false;
      });
    }
  }
}
