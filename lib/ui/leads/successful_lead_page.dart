import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/main_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SuccessfulLeadPage extends StatefulWidget {
  static const routeName = "/successfulLeadPage";

  const SuccessfulLeadPage({Key key}) : super(key: key);

  _SuccessfulLeadPage createState() => _SuccessfulLeadPage();
}

class _SuccessfulLeadPage extends State<SuccessfulLeadPage> {

  bool isProgressBarVisible = false;

  int _radioButtonValue = 1;
  int _paymentRemainder = 0;
  int clientId;
  int contractSum = 0;
  FocusNode teacherNameNode;
  FocusNode prepaymentNode;

  String _valueChooseCourse;
  List _listOfCourses = [];

  List<GroupItem> groups = [];
  String _valueChooseGroup;
  List _listOfGroups = [];
  List _listOfGroupsId = [];


  final teacherNameController = TextEditingController();
  final prepaymentController = TextEditingController();

  Map arguments;

  @override
  void initState() {
    context.read<SuccessfulLeadBloc>().add(LoadCoursesAndGroups());
    teacherNameNode = FocusNode();
    prepaymentNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    teacherNameNode.dispose();
    prepaymentNode.dispose();
    teacherNameController.dispose();
    prepaymentController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      clientId = arguments[AppConstants.CLIENT_ID];
    }

    return Scaffold(
      appBar: _getAppBar(context),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.symmetric(horizontal: 18),
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
        AppLocalizations.of(context).translate('successfulDeal'),
        style: TextStyle(
            color: ColorPalettes.textColorBlack,
            fontFamily: 'Golos',
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 18),
              Text(
                AppLocalizations.of(context).translate('cool'),
                style: TextStyle(
                    fontFamily: 'Golos',
                    color: ColorPalettes.textColorBlack,
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 18),
              Text(
                AppLocalizations.of(context).translate('whereToAddStudent'),
                style: TextStyle(
                    fontFamily: 'Golos',
                    color: ColorPalettes.textColorBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 25),
              CustomText(text: AppLocalizations.of(context).translate('course')),
              SizedBox(height: 10),
              CustomDropdownButton(
                hintText: '',
                value: _valueChooseCourse,
                listItems: _listOfCourses,
                onChanged: (newValue) {
                  setState(() {
                    _valueChooseCourse = newValue;
                    _valueChooseGroup = null;
                    _listOfGroups.clear();
                    _listOfGroupsId.clear();
                    for (int i = 0; i < groups.length; i++) {
                      if (groups[i].name.contains(_valueChooseCourse)) {
                        _listOfGroups.add(groups[i].name);
                        _listOfGroupsId.add(groups[i].id);
                      }
                    }
                  });
                },
              ),
              SizedBox(height: 20),
              CustomText(text: AppLocalizations.of(context).translate('group')),
              SizedBox(height: 10),
              CustomDropdownButton(
                hintText: '',
                value: _valueChooseGroup,
                listItems: _listOfGroups,
                onChanged: (newValue) {
                  setState(() {
                    _valueChooseGroup = newValue;
                    if (_valueChooseGroup != null) {
                      int groupID = _listOfGroupsId[_listOfGroups.indexOf(_valueChooseGroup)];
                      context.read<SuccessfulLeadBloc>().add(LoadGroupDetails(0,groupID));
                    }
                  });
                },
              ),
              SizedBox(height: 20),
              CustomText(text: AppLocalizations.of(context).translate('teacher'), isRequiredField: false,),
              SizedBox(height: 10),
              CustomTextField(
                textEditingController: teacherNameController,
                hint: AppLocalizations.of(context).translate('teacherSNM'),
                onChanged: (text) {setState(() {});},
                maxLines: 1,
                keyboardType: TextInputType.text,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(height: 20),
              CustomText(text: AppLocalizations.of(context).translate('prepayment'), isRequiredField: false,),
              SizedBox(height: 10),
              CustomTextField(
                textEditingController: prepaymentController,
                onChanged: (text) {setState(() {
                  int val = int.tryParse(prepaymentController.text) ?? 0;
                  print("$val $contractSum");
                  _paymentRemainder = val - (contractSum);
                });},
                focusNode: prepaymentNode,
                keyboardType: TextInputType.number,
                maxLines: 1,
              ),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('paymentRemainder:'),
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.dashed,
                                decorationColor:  ColorPalettes.textColorBlack,
                                decorationThickness: 2,
                                color: ColorPalettes.deepPurple,
                                fontFamily: 'Golos',
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text('${_paymentRemainder.toString()}с',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.dashed,
                                  decorationThickness: 2,
                                  color: ColorPalettes.textColorBlack,
                                  fontFamily: 'Golos',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500
                              )),
                        ],
                      ),
                    ],
                  )
              ),
              SizedBox(height: 40),
              BlocBuilder<SuccessfulLeadBloc, SuccessfulLeadState>(
                builder: (context, state) {
                  print('State is $state');
                  if (state is GroupDetailsLoadingTwo) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showProgressBar();
                    });
                  }
                  if (state is GroupDetailsNoDataTwo) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      hideProgressBar();
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotConnectToServer'));
                    });
                  }
                  if (state is GroupDetailsHasDataTwo) {

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      hideProgressBar();
                      teacherNameController.text = state.groupDetailsResult.group.teacher;
                      contractSum = state.groupDetailsResult.group.contractSum;
                      print(contractSum);
                    });
                  }
                  if (state is GroupDetailsErrorTwo) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      hideProgressBar();
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('unknownError'));
                      context.read<SuccessfulLeadBloc>().add(SuccessfulLeadStateChange());
                    });
                  }

                  if (state is LoadCoursesAndGroupsLoading) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showProgressBar();
                    });
                  }
                  if (state is LoadCoursesAndGroupsHasData) {
                    if (_listOfCourses.isEmpty) {
                      _listOfCourses.clear();
                      for(int i =0; i < state.coursesResult.results.length; i++) {
                        _listOfCourses.add(state.coursesResult.results[i].name);
                      }
                    }
                    if (_listOfGroups.isEmpty) {
                      groups.clear();
                      for(int i =0; i < state.groupsResult.results.length; i++) {
                        groups.add(GroupItem(id:state.groupsResult.results[i].id, name: state.groupsResult.results[i].name));
                      }
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      hideProgressBar();
                    });
                  }
                  if (state is LoadCoursesAndGroupsNoData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      hideProgressBar();
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotConnectToServer'));
                    });
                  }
                  if (state is LoadCoursesAndGroupsError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      hideProgressBar();
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotConnectToServer'));
                    });
                  }

                  if (state is SuccessfulLeadHasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('studentAdded'));
                      context.read<SuccessfulLeadBloc>().add(SuccessfulLeadStateChange());
                      //Navigator.pop(context, true);
                      Navigation.intentWithClearAllRoutesWithData(context, MainPage.routeName,{AppConstants.IS_KANBAN_SHOULD_REFRESH: true});
                    });
                  }
                  if (state is SuccessfulLeadNoData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotConnectToServer'));
                    });
                  }
                  if (state is SuccessfulLeadNoInternetConnection) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('noInternetConnection'));
                    });
                  }
                  if (state is SuccessfulLeadError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('unknownError'));
                      context.read<SuccessfulLeadBloc>().add(SuccessfulLeadStateChange());
                    });
                  }
                  if (state is SuccessfulLeadLoading) {
                    return LoadingIndicator();

                  } else {

                    return CustomButton(
                      text: AppLocalizations.of(context).translate('toAdd'),
                      isClickable: _valueChooseGroup!=null && teacherNameController.text.length>0 && prepaymentController.text.length>0
                      ? true : false,
                      onPressed: () {
                        print('Group idi: $_valueChooseCourse ${clientId} ${_listOfGroups.where((e)=> e==_valueChooseGroup)}');
                        int groupId = _listOfGroupsId[_listOfGroups.indexOf(_valueChooseGroup)];
                        context.read<SuccessfulLeadBloc>().add(SubmitLeadSuccess(clientId,groupId));
                      },
                    );
                  }

                },
              ),
              SizedBox(height: 20),
            ],
          ),
          Positioned(
              top: 0,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    final  offsetAnimation = Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0)).animate(animation);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  child: isProgressBarVisible ? LinearLoadingIndicator() : SizedBox())),
        ],
      ),
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


class PlaceHolder {

  int id;
  String name;

  PlaceHolder({
    this.id,
    this.name
  }) {
    if (this.id == null) {
      this.id = -1;
    }
    if (this.name == null) {
      this.name = "";
    }

  }
}
