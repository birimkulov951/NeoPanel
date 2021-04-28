import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/notifications_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ClientCardPage extends StatefulWidget {
  static const routeName = "/clientCardPage";

  const ClientCardPage({Key key}) : super(key: key);

  _ClientCardPage createState() => _ClientCardPage();
}

class _ClientCardPage extends State<ClientCardPage> {



  final List<String> date = <String>['07.07.2020', '06.07.2020', '08.07.2020', '09.07.2020', '23.07.2020'];
  final List<String> time = <String>['15:04', '11:04', '13:04', '14:04', '12:04'];
  final List<String> commentedName = <String>['Айданова Айдана ', 'Айданова Айдана ', 'Айданова Айдана ', 'Айданова Айдана ', 'Айданова Айдана '];
  final List<String> comments = <String>['Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.',
    'Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.',
    'Хочет поговорить с учителем.', 'Хочет поговорить с учителем, лучше назначить встречу.', 'Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.'];

  final List<String> actionHistory = <String>['Редактировал профиль', 'Перенес в Записан на пробный урок', 'Создал заявку', 'Создал заявку', 'Создал заявку'];

  List<CommentItem> leadComments = [];
  List<String> leadStatuses = [];
  List<int> leadStatusIds = [];

  final commentText = TextEditingController();

  int clientId;
  String clientSurname;
  String clientName;
  String clientMiddleName;
  String clientPhone;
  String clientCourse;
  String clientSource;
  String clientCity;
  String clientHasLaptop;
  String clientStatus;


  bool isLoadOnce = true;
  bool isProgressBarVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) {
      clientId = arguments[AppConstants.CLIENT_ID];
      clientSurname = arguments[AppConstants.CLIENT_SURNAME];
      clientName = arguments[AppConstants.CLIENT_NAME];
      clientPhone = arguments[AppConstants.CLIENT_PHONE];
      clientCity = arguments[AppConstants.CLIENT_CITY];
      clientCourse = arguments[AppConstants.CLIENT_COURSE];
      clientStatus = arguments[AppConstants.CLIENT_STATUS];
    }


    //clientSource = arguments[AppConstants.CLIENT_SOURCE];
    //clientCity = arguments[AppConstants.CLIENT_CITY];
    //clientHasLaptop = arguments[AppConstants.CLIENT_HAS_LAPTOP];

    print(arguments[AppConstants.CLIENT_ID]);
    print(arguments[AppConstants.CLIENT_SURNAME]);
    print(arguments[AppConstants.CLIENT_NAME]);
    print(arguments[AppConstants.CLIENT_PHONE]);
    print(arguments[AppConstants.CLIENT_CITY]);
    print(arguments[AppConstants.CLIENT_COURSE]);
    //print(arguments[AppConstants.CLIENT_SOURCE]);
    //print(arguments[AppConstants.CLIENT_HAS_LAPTOP]);
    print(arguments[AppConstants.CLIENT_STATUS]);

    if (isLoadOnce) {
      isLoadOnce = false;
      context.read<LeadDetailsBloc>().add(LoadLeadDetails(clientId,0));
      context.read<LeadDetailsBloc>().add(LoadStatuses());
    }


    return Scaffold(
          appBar: _getAppBar(context),
          backgroundColor: ColorPalettes.white,
          body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              //color:  ColorPalettes.boardViewListColor,
              child: Stack(
                children: [
                  Column(
                    children: [
                      clientCard(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('comments:'),
                            style: TextStyle(
                                fontFamily: 'Golos',
                                color: ColorPalettes.textColorBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      leadComments.length == 0 ? Column(
                        children: [
                          SizedBox(height: 20,),
                          Text(
                            AppLocalizations.of(context).translate('noComments'),
                            style: TextStyle(
                                fontFamily: 'Golos',
                                color: ColorPalettes.textColorGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 20,)
                        ],
                      ) : Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(width: 1, color: ColorPalettes.greyStroke),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListView.builder(
                                shrinkWrap: true,
                                reverse: false,
                                itemCount: leadComments.length,
                                itemBuilder: (context, item) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 14,),
                                      Text(
                                        "${leadComments[item].commentDateTime.substring(8,10)??''}.${leadComments[item].commentDateTime.substring(5,7)??''}."
                                            "${leadComments[item].commentDateTime.substring(2,4)??''}   ${leadComments[item].commentDateTime.substring(15,18)??''}.",
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: 7,),
                                      Text(
                                        leadComments[item].userName??'',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(height: 7,),
                                      Text(
                                        leadComments[item].comment??'',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: 14,),
                                      Divider(
                                        height: 0,
                                        thickness: 1,
                                        color: ColorPalettes.greyStroke,
                                        indent: 0,
                                        endIndent: 0,
                                      ),
                                    ],
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      CustomButtonWhiteSmall(
                        text: AppLocalizations.of(context).translate('showMore'),
                        isClickable: true,
                        onPressed: () {
                        },
                      ),



                      SizedBox(height: 20),
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(width: 1, color: ColorPalettes.greyStroke),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).translate('addComment'),
                                style: TextStyle(
                                    height: 1.5,
                                    fontFamily: 'Golos',
                                    color: ColorPalettes.textColorGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 7),
                              TextField(
                                onChanged: (text) {
                                  setState(() {

                                  });
                                },
                                controller: commentText,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 18, top: 4, bottom: 4),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(
                                      color: ColorPalettes.greyStroke,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    borderSide: BorderSide(
                                      color: ColorPalettes.greyStroke,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      CustomButtonWhiteSmall(
                        text: AppLocalizations.of(context).translate('send'),
                        isClickable: commentText.text.length > 0,
                        onPressed: () {
                        },
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('actionHistory'),
                            style: TextStyle(
                                color: ColorPalettes.textColorBlack,
                                fontFamily: 'Golos',
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(width: 1, color: ColorPalettes.greyStroke),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              for (int item = 0; item < actionHistory.length; item++)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 14,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          date[item],
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '  time[item]',
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7,),
                                    Text(
                                      commentedName[item],
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorGrey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(height: 7,),
                                    Text(
                                      actionHistory[item],
                                      style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.textColorBlack,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 14,),
                                    Divider(
                                      height: 0,
                                      thickness: 1,
                                      color: ColorPalettes.greyStroke,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                          text: AppLocalizations.of(context).translate('toStudentApplication'),
                          isClickable: true,
                          onPressed: () {

                          }
                      ),
                      SizedBox(height: 20),
                      CustomButtonWhite(
                          text: AppLocalizations.of(context).translate('toWaitingList'),
                          isClickable: true,
                          onPressed: () {

                          }
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
                          child: isProgressBarVisible ? LinearLoadingIndicator() : SizedBox()))
                ],
              )
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
            Object obj =  {AppConstants.IS_KANBAN_SHOULD_REFRESH: true};
            Navigator.of(context).pop(obj);
          }),
      titleSpacing: 0.0,
      title: Text(
        AppLocalizations.of(context).translate('clientCard'),
          style: TextStyle(
              color: ColorPalettes.textColorBlack,
              fontFamily: 'Golos',
              fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(IconAssets.notificationsIconBlack),
            onPressed: () {
              Navigation.intentWithData(context, NotificationsPage.routeName, {
                AppConstants.IS_APPBAR_ALLOWED: true,
              });
            }),
      ],
    );
  }

  Widget clientCard(BuildContext context) {
    return BlocBuilder<LeadDetailsBloc, LeadDetailsState>(
      builder: (context, state) {
        print('State is $state');
        if (state is LeadStatusesLoading) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            showProgressBar();
          });
        }
        if (state is LeadStatusesHasData) {
          leadStatuses.clear();
          leadStatusIds.clear();
          for (int i = 0; i < state.leadStatuses.results.length; i++) {
            leadStatuses.add(state.leadStatuses.results[i].name);
            leadStatusIds.add(state.leadStatuses.results[i].id);
          }
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            //setState(() {
              hideProgressBar();
            //});
          });
        }
        if (state is LeadStatusesNoData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotDownloadData'));
            hideProgressBar();
          });
        }
        if (state is LeadStatusesError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('unknownError'));
            hideProgressBar();
          });
        }

        if (state is LeadStatusChangeLoadingTwo) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            showProgressBar();
          });
        }
        if (state is LeadStatusChangeHasDataTwo) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            //clientStatus =
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('changesSaved'));
          });
        }
        if (state is LeadStatusChangeNoDataTwo) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotChangeLeadStatus'));
          });
        }
        if (state is LeadStatusChangeErrorTwo) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotChangeLeadStatus'));
          });
        }

        if (state is LeadDetailsHasData) {
          if (state.leadDetailsResult != null) {
            clientId = state.leadDetailsResult.lead.id;
            clientSurname = state.leadDetailsResult.lead.surname;
            clientName = state.leadDetailsResult.lead.name;
            clientMiddleName = state.leadDetailsResult.lead.middleName;
            clientPhone = state.leadDetailsResult.lead.phone;
            clientCourse = state.leadDetailsResult.lead.courseName;
            //clientSource = state.leadDetailsResult.lead.;
            clientCity = state.leadDetailsResult.lead.cityName;
            //clientHasLaptop = state.leadDetailsResult.lead..toString();
            clientStatus = state.leadDetailsResult.lead.leadStatus;
            leadStatuses.add(clientStatus);
            //leadComments = state.leadDetailsResult.lead.leadComments as List<CommentItem>;
            print(leadComments);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                hideProgressBar();
                context.read<LeadDetailsBloc>().add(LeadDetailsStateChange());
              });
            });
          }
        }
        if (state is LeadDetailsNoData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotDownloadData'));
            hideProgressBar();
          });
        }
        if (state is LeadDetailsNoInternetConnection) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('noInternetConnection'));
          });
        }
        if (state is LeadDetailsError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotDownloadData'));
          });
        }
        return Column(
          children: [
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID ${clientId??AppLocalizations.of(context).translate('notIndicated')}',
                  style: TextStyle(
                      color: ColorPalettes.textColorGrey,
                      fontFamily: 'Golos',
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '01.05.21',
                      style: TextStyle(
                          color: ColorPalettes.textColorGrey,
                          fontFamily: 'Golos',
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      ' | 18.00',
                      style: TextStyle(
                          color: ColorPalettes.textColorGrey,
                          fontFamily: 'Golos',
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 14),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(width: 1, color: ColorPalettes.purpleGreyStroke),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16,bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${clientSurname??''} ${clientName??''} ${clientMiddleName??''}',
                      style: TextStyle(
                          height: 1.5,
                          fontFamily: 'Golos',
                          color: ColorPalettes.textColorBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        child: Text(
                          clientPhone??AppLocalizations.of(context).translate('notIndicated'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                    ),
                    Container(
                        transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 0,
                              color: Color(0xFFFDD835),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    clientCourse??AppLocalizations.of(context).translate('notIndicated'),
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                            Card(
                              elevation: 0,
                              color: Color(0xFF787885),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    clientSource??AppLocalizations.of(context).translate('notIndicated'),
                                    style: TextStyle(
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )),
                            )
                          ],
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('city:'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          clientCity??AppLocalizations.of(context).translate('notIndicated'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('laptop:'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          clientHasLaptop??AppLocalizations.of(context).translate('notIndicated'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      width: Sizes.width(context),
                      height: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('status:'),
                            style: TextStyle(
                                height: 1.5,
                                fontFamily: 'Golos',
                                color: ColorPalettes.textColorBlack,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            //width: Sizes.width(context) * .6,
                            child: DropdownButton(
                              dropdownColor: ColorPalettes.white,
                              icon: SvgPicture.asset(IconAssets.dropDownIcon),
                              isExpanded: true,
                              underline: SizedBox(),
                              style: TextStyle(
                                  fontFamily: 'Golos',
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: ColorPalettes.textColorBlack
                              ),
                              value: clientStatus,
                              onChanged: (newValue) {
                                clientStatus = newValue;
                                int statusId = leadStatusIds[leadStatuses.indexOf(clientStatus)];
                                context.read<LeadDetailsBloc>().add(LeadStatusChange(clientId,statusId));
                              },
                              items: leadStatuses == null ? null : leadStatuses.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 40)
          ],
        );
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
