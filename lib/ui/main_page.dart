import 'package:shared/shared.dart';
import 'package:core/core.dart';
import 'package:neopanel/ui/action_history_page.dart';
import 'package:neopanel/ui/archive/archive_page.dart';
import 'package:neopanel/ui/authorization/authorization_page.dart';
import 'package:neopanel/ui/employees/employees_page.dart';
import 'package:neopanel/ui/leads/client_form_page.dart';
import 'package:neopanel/ui/leads/kanban_page.dart';
import 'package:neopanel/ui/employees/employee_form_page.dart';
import 'package:neopanel/ui/forms/course_form_page.dart';
import 'package:neopanel/ui/forms/group_form_page.dart';
import 'package:neopanel/ui/menu/waiting_list_page.dart';
import 'package:neopanel/ui/my_profile_page.dart';
import 'package:neopanel/ui/notifications_page.dart';
import 'package:neopanel/ui/settings/city_form_page.dart';
import 'package:neopanel/ui/settings/settings_page.dart';
import 'package:neopanel/ui/students/student_form_page.dart';
import 'package:neopanel/ui/students/students_page.dart';
import 'package:neopanel/ui/teachers/teacher_form_page.dart';
import 'package:neopanel/ui/teachers/teachers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


class MainPage extends StatefulWidget {
  static const routeName = '/mainPage';
  final String title;

  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;

  MainPage(
      {Key key,
        this.title,
        this.menuScreenContext,
        this.onScreenHideButtonPressed,
        this.hideStatus})
      : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _displayingPageId = 0;
  String _displayingPageName;

  String userName;
  String userRole;
  String circleAvatarLetter;

  _getPageById(int id) {
    switch (id) {
      case 0:
        return new KanbanPage();
      case 1:
        return new ActionHistoryPage();
      case 2:
        return new NotificationsPage();

    }
  }

  Future<bool> _willPopCallback() async {
    if (_displayingPageId == 1 || _displayingPageId == 2) {
      setState(() {
        _displayingPageId = 0;
      });
      return false;
    } else {
      // await showDialog or Show add banners or whatever
      // then
      return true;
    }
  }

  @override
  void initState() {
    context.read<CurrentUserBloc>().add(GetCurrentUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_displayingPageId == 0) {
      _displayingPageName = AppLocalizations.of(context).translate('stages');
    } else if (_displayingPageId == 1) {
      _displayingPageName = AppLocalizations.of(context).translate('actionHistory');
    } else {
      _displayingPageName = AppLocalizations.of(context).translate('notifications');
    }
    return WillPopScope(
        onWillPop: () async => _willPopCallback(),
        child: Scaffold(
          backgroundColor: ColorPalettes.white,
          appBar: _getAppBar(context),
          body: _getPageById(_displayingPageId),
          floatingActionButton: FloatingActionButton(
              backgroundColor: ColorPalettes.iconGreen,
              child: SvgPicture.asset(IconAssets.plusIcon),
              elevation: 1,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: ColorPalettes.white,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      side: BorderSide(
                          color: ColorPalettes.greyStroke,
                          width: 1)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (BuildContext context) {
                    return Container(
                        height: 465 /*MediaQuery.of(context).size.height * 0.685*/,
                        child: _getCustomAdditionSheet(context)
                    );
                  },
                );
              }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 6,
            notchMargin: 6,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: SvgPicture.asset(IconAssets.menuIcon),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: ColorPalettes.white,
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            side: BorderSide(
                                color: ColorPalettes.greyStroke,
                                width: 1)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        builder: (BuildContext context) {
                          return Container(
                            height: 547/*MediaQuery.of(context).size.height * 0.72*/,
                            child: _getCustomMenuSheet(context),
                          );
                        },
                      );
                    }),
                Spacer(),
                IconButton(icon: SvgPicture.asset(IconAssets.filterIcon),
                    onPressed: () {
                      CustomToast.showCustomToast(context, "Show filters");
                    }),
              ],
            ),
          ),
        )
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: ColorPalettes.white,
      brightness: Brightness.light,
      title: Text(
          _displayingPageName,
          style: TextStyle(
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        // to update
        BlocBuilder<CurrentUserBloc, CurrentUserState>(
          builder: (context, state) {
            print('State is $state');
            if (state is CurrentUserHasData) {
              if (userName == null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  userName = state.currentUserResult.name;
                  circleAvatarLetter = state.currentUserResult.name[0];

                  if (state.currentUserResult.roles[0] == "Superadmin") {
                    userRole = AppLocalizations.of(context).translate('superAdmin');
                  } else if (state.currentUserResult.roles[0] == "Admin") {
                    userRole = AppLocalizations.of(context).translate('admin');
                  } else {
                    userRole = AppLocalizations.of(context).translate('smmAgent');
                  }
                });
              }
            }
            if (state is CurrentUserError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                CustomToast.showCustomToast(context,
                    AppLocalizations.of(context).translate('unknownError'));
              });
            }
            return Text('');
          },
        ),
        IconButton(
            icon: _displayingPageId == 1 ? SvgPicture.asset(
                IconAssets.actionHistoryIconGreen) :
            SvgPicture.asset(IconAssets.actionHistoryIconBlack),
            onPressed: () {
              setState(() {
                _displayingPageId = 1;
              });
            }),
        IconButton(
            icon: _displayingPageId == 2 ? SvgPicture.asset(
                IconAssets.notificationsIconGreen) :
            SvgPicture.asset(IconAssets.notificationsIconBlack),
            onPressed: () {
              setState(() {
                _displayingPageId = 2;
              });
            }),
      ],
    );
  }

  _getCustomMenuSheet(BuildContext context) {
    return Scaffold(
        body: Container(
          //height: Sizes.height(context) * .65,
          color: ColorPalettes.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 11, 2, 15),
                child: GestureDetector(
                  onTap: () {
                    Navigation.intent(context, MyProfilePage.routeName);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: ColorPalettes.iconGreen,
                        child: Text(
                          circleAvatarLetter??'',
                          style: TextStyle(
                              fontFamily: 'Golos',
                              color: ColorPalettes.white,
                              fontSize: 20
                          ),
                        )
                    ),
                    title:  Text(
                      userName??AppLocalizations.of(context).translate('notIndicated'),
                      style: TextStyle(
                          color: ColorPalettes.textColorBlack,
                          fontFamily: 'Golos',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle:  Text(
                      userRole??AppLocalizations.of(context).translate('notIndicated'),
                      style: TextStyle(
                          color: ColorPalettes.grey,
                          fontFamily: 'Golos',
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing:
                    Container(
                      transform: Matrix4.translationValues(14.0, -10.0, 0.0),
                      child: IconButton(
                          icon: SvgPicture.asset(IconAssets.closeIcon),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child:  InkWell(
                  onTap: () {
                    setState((){
                      _displayingPageId = 0;
                      _displayingPageName = AppLocalizations.of(context).translate('stages');
                      Navigator.pop(context);
                    });
                  }, // Handle your callback
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.mainPageIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        AppLocalizations.of(context).translate('mainPage'),
                        style: TextStyle(
                            color: _displayingPageId == 0 ? ColorPalettes.iconGreen : ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigation.intent(context, StudentsPage.routeName);
                  }, // Handle your callback
                  child:  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.studentsIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        AppLocalizations.of(context).translate('students'),
                        style: TextStyle(
                            color: _displayingPageId == 3 ? ColorPalettes.iconGreen : ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child:InkWell(
                  onTap: () {
                    Navigation.intent(context, EmployeesPage.routeName);
                  }, // Handle your callback
                  child:  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.employeesIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        AppLocalizations.of(context).translate('employees'),
                        style: TextStyle(
                            color: _displayingPageId == 4 ? ColorPalettes.iconGreen : ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigation.intent(context, TeachersPage.routeName);
                  }, // Handle your callback
                  child:  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.teachersIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        AppLocalizations.of(context).translate('teachers'),
                        style: TextStyle(
                            color: ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigation.intent(context, WaitingListPage.routeName);
                  }, // Handle your callback
                  child:  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.waitListIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        AppLocalizations.of(context).translate('waitingList'),
                        style: TextStyle(
                            color: _displayingPageId == 5 ? ColorPalettes.iconGreen : ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigation.intent(context, ArchivePage.routeName);
                  }, // Handle your callback
                  child:  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.archiveIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        AppLocalizations.of(context).translate('archive'),
                        style: TextStyle(
                            color: _displayingPageId == 6 ? ColorPalettes.iconGreen : ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    Navigation.intent(context, SettingsPage.routeName);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.settingsIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        AppLocalizations.of(context).translate('settings'),
                        style: TextStyle(
                            color: _displayingPageId == 7 ? ColorPalettes.iconGreen : ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: ColorPalettes.greyStroke,
                indent: 20,
                endIndent: 20,
              ),
              Material(
                child: InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    showDialog(context: context, builder: (context) =>
                                CustomDialogAlert(
                                    title:  AppLocalizations.of(context).translate('alreadyLeaving'),
                                    subTitle: AppLocalizations.of(context).translate('exitSystem'),
                                    onNegative: () {
                                      Navigator.pop(context);
                                    },
                                    onPositive: () {
                                      Navigation.intentWithClearAllRoutes(context, AuthorizationPage.routeName);
                                    }));
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                    leading:  SvgPicture.asset(IconAssets.exitIcon),
                    title:
                    Container(
                      transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                      child: Text(
                        AppLocalizations.of(context).translate('exit'),
                        style: TextStyle(
                            color: ColorPalettes.textColorBlack,
                            fontFamily: 'Golos',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  _getCustomAdditionSheet(BuildContext context) {
    return Container(
      color: ColorPalettes.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 2, 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('addition'),
                      style: TextStyle(
                          color: ColorPalettes.textColorBlack,
                          fontFamily: 'Golos',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        icon: SvgPicture.asset(IconAssets.closeIcon),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ]
              )),
          Divider(
            height: 0,
            thickness: 1,
            color: ColorPalettes.greyStroke,
            indent: 20,
            endIndent: 20,
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigation.intent(context, ClientFormPage.routeName);
              }, // Handle your callback
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                leading:  SvgPicture.asset(IconAssets.addIconPurple),
                title: Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    AppLocalizations.of(context).translate('request'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: ColorPalettes.greyStroke,
            indent: 20,
            endIndent: 20,
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigation.intent(context, StudentFormPage.routeName);
              }, // Handle your callback
              child:  ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                leading:  SvgPicture.asset(IconAssets.addIconPurple),
                title:
                Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    AppLocalizations.of(context).translate('student'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: ColorPalettes.greyStroke,
            indent: 20,
            endIndent: 20,
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigation.intent(context, CourseFormPage.routeName);
              }, // Handle your callback
              child:  ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                leading:  SvgPicture.asset(IconAssets.addIconPurple),
                title:
                Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    AppLocalizations.of(context).translate('course'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: ColorPalettes.greyStroke,
            indent: 20,
            endIndent: 20,
          ),
          Material(
            child:InkWell(
              onTap: () {
                Navigation.intent(context, GroupFormPage.routeName);
              }, // Handle your callback
              child:  ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                leading:  SvgPicture.asset(IconAssets.addIconPurple),
                title:
                Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    AppLocalizations.of(context).translate('group'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          // Divider(
          //   height: 0,
          //   thickness: 1,
          //   color: ColorPalettes.greyStroke,
          //   indent: 20,
          //   endIndent: 20,
          // ),
          // Material(
          //   child: InkWell(
          //     onTap: () {}, // Handle your callback
          //     child:  ListTile(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
          //       leading:  SvgPicture.asset(IconAssets.addIconPurple),
          //       title:
          //       Container(
          //         transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
          //         padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
          //         child: Text(
          //           AppLocalizations.of(context).translate('position'),
          //           style: TextStyle(
          //               color: ColorPalettes.textColorBlack,
          //               fontFamily: 'Golos',
          //               fontSize: 15,
          //               fontWeight: FontWeight.w500),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Divider(
            height: 0,
            thickness: 1,
            color: ColorPalettes.greyStroke,
            indent: 20,
            endIndent: 20,
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigation.intent(context, EmployeeFormPage.routeName);
              }, // Handle your callback
              child:  ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                leading:  SvgPicture.asset(IconAssets.addIconPurple),
                title:
                Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    AppLocalizations.of(context).translate('internalEmployee'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: ColorPalettes.greyStroke,
            indent: 20,
            endIndent: 20,
          ),
          Material(
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                Navigation.intent(context, TeacherFormPage.routeName);
              },
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                leading:  SvgPicture.asset(IconAssets.addIconPurple),
                title:
                Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    AppLocalizations.of(context).translate('teacher'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: ColorPalettes.greyStroke,
            indent: 20,
            endIndent: 20,
          ),
          Material(
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                Navigation.intent(context, CityFormPage.routeName);
              },
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
                leading:  SvgPicture.asset(IconAssets.addIconPurple),
                title:
                Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    AppLocalizations.of(context).translate('city'),
                    style: TextStyle(
                        color: ColorPalettes.textColorBlack,
                        fontFamily: 'Golos',
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}