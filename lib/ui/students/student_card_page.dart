import 'package:shared/shared.dart';
import 'package:core/core.dart';
import 'package:neopanel/ui/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class StudentCardPage extends StatefulWidget {
  static const routeName = "/studentCardPage";

  const StudentCardPage({Key key}) : super(key: key);

  _StudentCardPage createState() => _StudentCardPage();
}

class _StudentCardPage extends State<StudentCardPage> {


  final List<String> date = <String>['07.07.2020', '06.07.2020', '08.07.2020', '09.07.2020', '23.07.2020'];
  final List<String> time = <String>['15:04', '11:04', '13:04', '14:04', '12:04'];
  final List<String> commentedName = <String>['Айданова Айдана ', 'Айданова Айдана ', 'Айданова Айдана ', 'Айданова Айдана ', 'Айданова Айдана '];
  final List<String> comments = <String>['Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.',
    'Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.',
    'Хочет поговорить с учителем.', 'Хочет поговорить с учителем, лучше назначить встречу.', 'Хочет поговорить с учителем, чтобы понять программу, лучше назначить встречу.'];

  final List<String> actionHistory = <String>['Редактировал профиль', 'Перенес в Записан на пробный урок', 'Создал заявку', 'Создал заявку', 'Создал заявку'];

  final commentText = TextEditingController();

  int studentId;
  String studentSurname;
  String studentName;
  String studentMiddleName;
  String studentCity;
  String studentGroup;
  String studentTeacher;
  String studentStartDate;
  String studentEndDate;
  String studentPaymentStatus;

  String studentPhone;
  String studentEmail;
  String studentAddress;
  String studentSource;
  bool studentHasLaptop;

  bool isLoadedOnce = false;


  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      studentId = arguments[AppConstants.CLIENT_ID];
      studentSurname = arguments[AppConstants.CLIENT_SURNAME];
      studentName = arguments[AppConstants.CLIENT_NAME];
      studentMiddleName = arguments[AppConstants.CLIENT_MIDDLE_NAME];
      studentCity = arguments[AppConstants.CLIENT_CITY];
      studentGroup = arguments[AppConstants.CLIENT_GROUP];
      studentTeacher = arguments[AppConstants.CLIENT_TEACHER];
      studentStartDate = arguments[AppConstants.CLIENT_START_DATE];
      studentEndDate = arguments[AppConstants.CLIENT_END_DATE];
      studentPaymentStatus = arguments[AppConstants.CLIENT_PAYMENT_STATUS];
    }

    if (!isLoadedOnce) {
      isLoadedOnce = true;
      context.read<StudentDetailsBloc>().add(LoadStudentDetails(studentId));
    }


    return Scaffold(
      appBar: _getAppBar(context),
      backgroundColor: ColorPalettes.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              studentCard(context),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('paymentHistory'),
                    style: TextStyle(
                        fontFamily: 'Golos',
                        color: ColorPalettes.textColorBlack,
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
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '№',
                              style: TextStyle(
                                  color: ColorPalettes.textColorBlack,
                                  fontFamily: 'Golos',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              AppLocalizations.of(context).translate('date'),
                              style: TextStyle(
                                  color: ColorPalettes.textColorBlack,
                                  fontFamily: 'Golos',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              AppLocalizations.of(context).translate('month'),
                              style: TextStyle(
                                  color: ColorPalettes.textColorBlack,
                                  fontFamily: 'Golos',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              AppLocalizations.of(context).translate('placeOfPayment'),
                              style: TextStyle(
                                  color: ColorPalettes.textColorBlack,
                                  fontFamily: 'Golos',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      for (int item = 0; item < date.length; item++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.toString(),
                                  style: TextStyle(
                                      color: ColorPalettes.textColorGrey,
                                      fontFamily: 'Golos',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  date[item],
                                  style: TextStyle(
                                      color: ColorPalettes.textColorGrey,
                                      fontFamily: 'Golos',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '8500',
                                  style: TextStyle(
                                      color: ColorPalettes.textColorGrey,
                                      fontFamily: 'Golos',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Демир Банк ',
                                  style: TextStyle(
                                      color: ColorPalettes.textColorGrey,
                                      fontFamily: 'Golos',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('comments:'),
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
                      for (int item = 0; item < date.length; item++)
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
                                  ' ',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  time[item],
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
                              comments[item],
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
            Navigator.pop(context);
          }),
      titleSpacing: 0.0,
      title: Text(
        AppLocalizations.of(context).translate('studentCard'),
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

  Widget studentCard(BuildContext context) {
    return BlocBuilder<StudentDetailsBloc, StudentDetailsState>(
      builder: (context, state) {
        print('State is $state');
        if (state is StudentDetailsHasData) {
          if (state.studentDetailsResult != null) {
            //studentId = state.studentDetailsResult.student.id;
            //studentSurname = state.studentDetailsResult.student.surname;
            //studentName = state.studentDetailsResult.student.name;
            //studentMiddleName = state.studentDetailsResult.student.middleName;
            //studentCity = state.studentDetailsResult.student.cityName;
            //studentGroup = state.studentDetailsResult.student.groups[0].name;
            //studentTeacher = state.studentDetailsResult.student.teacher;
            //studentStartDate = state.studentDetailsResult.student.date;
            //studentEndDate = state.studentDetailsResult.student.end;
            //studentPaymentStatus = state.studentDetailsResult.student.paymentStatus;
            studentPhone = state.studentDetailsResult.student.phone??AppLocalizations.of(context).translate('notIndicated');
            studentEmail = state.studentDetailsResult.student.email??AppLocalizations.of(context).translate('notIndicated');
            studentAddress = state.studentDetailsResult.student.address??AppLocalizations.of(context).translate('notIndicated');
            studentSource = state.studentDetailsResult.student.discriminator??AppLocalizations.of(context).translate('notIndicated');
            studentHasLaptop = state.studentDetailsResult.student.hasLaptop??AppLocalizations.of(context).translate('notIndicated');
          }

         context.read<StudentDetailsBloc>().add(StudentDetailsStateChange());
        }

        if (state is StudentDetailsNoData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotDownloadData'));
          });
        }
        if (state is StudentDetailsNoInternetConnection) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('noInternetConnection'));
          });
        }
        if (state is StudentDetailsError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
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
                  'ID ${studentId.toString()??''}',
                  style: TextStyle(
                      color: ColorPalettes.textColorGrey,
                      fontFamily: 'Golos',
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${studentStartDate.substring(8,10)??''}-${studentStartDate.substring(5,7)??''}-${studentStartDate.substring(0,4)??''} | ${studentStartDate.substring(11,16)??''}',
                  style: TextStyle(
                      color: ColorPalettes.textColorGrey,
                      fontFamily: 'Golos',
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${studentName??''} ${studentName??''} ${studentMiddleName??''}',
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
                          studentPhone??AppLocalizations.of(context).translate('notIndicated'),
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
                                    studentGroup??AppLocalizations.of(context).translate('notIndicated'),
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
                                    studentSource??AppLocalizations.of(context).translate('notIndicated'),
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
                          studentCity??AppLocalizations.of(context).translate('notIndicated'),
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
                          studentHasLaptop == true ? AppLocalizations.of(context).translate('yes') : AppLocalizations.of(context).translate('notIndicated'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
