import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/leads/client_card_page.dart';
import 'package:neopanel/ui/leads/failure_lead_page.dart';
import 'package:neopanel/ui/leads/successful_lead_page.dart';
import 'package:neopanel/ui/leads/column_form_page.dart';


import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class KanbanPage extends StatefulWidget {

  KanbanPage({Key key}) : super(key: key);

  @override
  _KanbanPage createState() => _KanbanPage();
}

class _KanbanPage extends State<KanbanPage>  {

  bool isLoadedOnce = false;
  bool isInitialLoadLoaded = false;

  bool isProgressBarVisible = false;

  bool isKanbanShouldRefresh = false;


  final List<BoardListObject> listData = [];

  //Can be used to animate to different sections of the BoardView
  final BoardViewController boardViewController = new BoardViewController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) {
      print('isKanbanShouldRefresh = ${arguments[AppConstants.IS_KANBAN_SHOULD_REFRESH]}');
      isKanbanShouldRefresh = arguments[AppConstants.IS_KANBAN_SHOULD_REFRESH];
      arguments[AppConstants.IS_KANBAN_SHOULD_REFRESH] = false;
    }

    if (!isInitialLoadLoaded) {
      isInitialLoadLoaded = true;
      if (isKanbanShouldRefresh) {
        isKanbanShouldRefresh = false;
        context.read<LeadsBloc>().add(LoadLeadsFromDio());
      } else {
        context.read<LeadsBloc>().add(LoadLeads());
      }
    }


    List<BoardList> _lists = [];

    return BlocBuilder<LeadsBloc, LeadsState>(
      builder: (context, state) {
        print('State is $state');
        if (state is LeadStatusChangeLoading) {
          isLoadedOnce = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showProgressBar();
          });
        }
        if (state is LeadStatusChangeHasData) {
          isLoadedOnce = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
          });
        }
        if (state is LeadStatusChangeNoData) {
          isLoadedOnce = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotChangeLeadStatus'));
            context.read<LeadsBloc>().add(LoadLeadsFromDio(0,0));
          });
        }
        if (state is LeadStatusChangeNoInternetConnection) {
          isLoadedOnce = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('noInternetConnection'));
            context.read<LeadsBloc>().add(LoadLeadsFromDio(0,0));
          });
        }
        if (state is LeadStatusChangeError) {
          isLoadedOnce = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            // todo fix toast error
            //CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('couldNotChangeLeadStatus'));
            context.read<LeadsBloc>().add(LoadLeadsFromDio());
          });
        }

        if (state is LoadLeadsFromDioHasData) {
          isLoadedOnce = false;

            if (!isLoadedOnce) {
            isLoadedOnce = true;
            _lists.clear();
            listData.clear();
            for (int status = 0; status < state.statusesResult.results.length; status++) {
              BoardListObject statusData = BoardListObject(id: state.statusesResult.results[status].id, statusTitle: state.statusesResult.results[status].name);
              for (int lead = 0; lead < state.leadsResult.results.length; lead++) {
                if (state.leadsResult.results[lead].leadStatus.contains(statusData.statusTitle)) {
                  BoardItemObject leadData = BoardItemObject(id: state.leadsResult.results[lead].id, surname: state.leadsResult.results[lead].surname, name: state.leadsResult.results[lead].name, phone: state.leadsResult.results[lead].phone, cityName: state.leadsResult.results[lead].cityName, courseName: state.leadsResult.results[lead].courseName, leadStatus: state.leadsResult.results[lead].leadStatus);
                  statusData.items.add(leadData);
                }
              }
              listData.add(statusData);
            }
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            //CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('kanbanBoardReloaded'));
          });
        }
        if (state is LoadLeadsFromDioNoData) {
          isLoadedOnce = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
           hideProgressBar();
           CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('errorOnKanbanBoardReloading'));
          });
        }
        if (state is LoadLeadsFromDioError) {
          isLoadedOnce = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
            CustomToast.showCustomToast(context, AppLocalizations.of(context).translate('errorOnKanbanBoardReloading'));
          });
        }

        if (state is LeadsHasData) {
          if (!isLoadedOnce) {
            isLoadedOnce = true;
            _lists.clear();
            listData.clear();
            for (int status = 0; status < state.statusesResult.results.length; status++) {
              BoardListObject statusData = BoardListObject(id: state.statusesResult.results[status].id, statusTitle: state.statusesResult.results[status].name);
              for (int lead = 0; lead < state.leadsResult.results.length; lead++) {
                if (state.leadsResult.results[lead].leadStatus.contains(statusData.statusTitle)) {
                  BoardItemObject leadData = BoardItemObject(id: state.leadsResult.results[lead].id, surname: state.leadsResult.results[lead].surname, name: state.leadsResult.results[lead].name, phone: state.leadsResult.results[lead].phone, cityName: state.leadsResult.results[lead].cityName, courseName: state.leadsResult.results[lead].courseName, leadStatus: state.leadsResult.results[lead].leadStatus);
                  statusData.items.add(leadData);
                }
              }
              listData.add(statusData);
            }
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hideProgressBar();
          });
        }
        if (state is LeadsNoData) {
          isLoadedOnce = false;
          return CustomErrorWidget(
            message: AppLocalizations.of(context).translate('noLeadsToShow'),
          );
        } else if (state is LeadsNoInternetConnection) {
          isLoadedOnce = false;
          return NoInternetWidget(
            message: AppLocalizations.of(context).translate('noInternetConnection'),
          );
        } else if (state is LeadsLoading) {
          isLoadedOnce = false;

          return LeadsShimmer();

        } else if (state is LeadsError) {
          isLoadedOnce = false;
          return CustomErrorWidget(
            message: AppLocalizations.of(context).translate('unknownError'),
          );
        } else {
          isLoadedOnce = false;
          for (int i = 0; i < listData.length + 1; i++) {
            if (i == listData.length) {
              _lists.add(_createAddBoardButton(context));
            }  else {
              _lists.add(_createBoardList(listData[i],context,i));
            }
          }

          return Padding(
            padding: const EdgeInsets.only(left: 0,right: 0, top: 0),
            child: Stack(
              children: [
                BoardView(
                  width: Sizes.width(context) * .92,
                  lists: _lists,
                  boardViewController: boardViewController,
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
      },
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject, BuildContext context) {
    return BoardItem(
        onStartDragItem: (int listIndex, int itemIndex, BoardItemState state) {

        },
        onDropItem: (int listIndex, int itemIndex, int oldListIndex, int oldItemIndex, BoardItemState state) {

          if (oldListIndex != listIndex) {
            context.read<LeadsBloc>().add(ChangeLeadStatus(listData[oldListIndex].items[oldItemIndex].id, listData[listIndex].id));
          }

          //Used to update our local item data
          setState(() {
            var item = listData[oldListIndex].items[oldItemIndex];

            listData[oldListIndex].items.removeAt(oldItemIndex);

            listData[listIndex].items.insert(itemIndex, item);
          });
        },
        onTapItem: (int listIndex, int itemIndex, BoardItemState state) {
              Navigation.intentWithData(context, ClientCardPage.routeName, {
                AppConstants.CLIENT_ID: listData[listIndex].items[itemIndex].id,
                AppConstants.CLIENT_SURNAME: listData[listIndex].items[itemIndex].surname,
                AppConstants.CLIENT_NAME: listData[listIndex].items[itemIndex].name,
                AppConstants.CLIENT_PHONE: listData[listIndex].items[itemIndex].phone,
                AppConstants.CLIENT_CITY: listData[listIndex].items[itemIndex].cityName,
                AppConstants.CLIENT_COURSE: listData[listIndex].items[itemIndex].courseName,
                AppConstants.CLIENT_STATUS: listData[listIndex].items[itemIndex].leadStatus,
                //AppConstants.CLIENT_HAS_LAPTOP: listData[listIndex].items[itemIndex].hasLaptop,
              });
        },
        item: Container(
          margin: EdgeInsets.fromLTRB(2, 8, 2, 6),
          child: GestureDetector(
            child: Card(
              elevation: 0.5,
              color: ColorPalettes.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14.0,
                      top: 14.0,
                      right: 14.0,
                      bottom: 0.0
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${itemObject.name} ${itemObject.surname}',
                            style: TextStyle(
                                height: 1.5,
                                fontFamily: 'Golos',
                                color: ColorPalettes.textColorBlack,
                                fontSize: 15,
                                fontWeight: FontWeight.w800),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                transform: Matrix4.translationValues(0.0, -3.0, 0.0),
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorBlack,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                  transform: Matrix4.translationValues(0.0, -3.0, 0.0),
                                  child: Text(
                                    AppLocalizations.of(context).translate('hourLetter'),
                                    style: TextStyle(
                                        height: 1.5,
                                        fontFamily: 'Golos',
                                        color: ColorPalettes.textColorBlack,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        itemObject.phone,
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: 'Golos',
                            color: ColorPalettes.textColorGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                          transform: Matrix4.translationValues(-5.0, 6.0, 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 0,
                                // todo this is adjustable color
                                color: Color(0xFFFDD835),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      itemObject.courseName,
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
                                      '#source',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          color: ColorPalettes.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    )),
                              )
                            ],
                          )),
                      Container(
                        transform: Matrix4.translationValues(0.0, -3.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context).translate('cityLetter'),
                                  style: TextStyle(
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  itemObject.cityName,
                                  style: TextStyle(
                                      fontFamily: 'Golos',
                                      color: ColorPalettes.textColorGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Container(
                                transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(icon: SvgPicture.asset(
                                        IconAssets.denyIcon
                                    ),
                                        onPressed: () {
                                          Navigation.intentWithData(context, FailureLeadPage.routeName, {AppConstants.CLIENT_ID: itemObject.id});
                                        }),
                                    IconButton(icon: SvgPicture.asset(
                                        IconAssets.approveIcon),
                                        onPressed: () {
                                         // navigateToSuccessLeadPage(context);
                                          Navigation.intentWithData(context, SuccessfulLeadPage.routeName, {AppConstants.CLIENT_ID: itemObject.id});
                                        }),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          )
        ));
  }

  Widget _createBoardList(BoardListObject list, BuildContext context, int index) {
    List<BoardItem> items = [];
    for (int i = 0; i < list.items.length; i++) {
      items.insert(i, buildBoardItem(list.items[i], context));
    }
    return BoardList(
      onStartDragList: (int listIndex) {},
      onTapList: (int listIndex) async {},
      onDropList: (int listIndex, int oldListIndex) {
        //Update our local list data
        var list = listData[oldListIndex];
        listData.removeAt(oldListIndex);
        listData.insert(listIndex, list);
      },
      headerBackgroundColor: ColorPalettes.white,
      backgroundColor: ColorPalettes.lightBG,
      header: [
        Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 0, top: 5,bottom: 15),
                child: Row(
                  children: [
                    Text(
                      list.statusTitle,
                      style: TextStyle(
                        fontFamily: 'Golos',
                          color: ColorPalettes.textColorBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        list.items.length.toString(),
                        style: TextStyle(
                            fontFamily: 'Golos',
                            color: ColorPalettes.softPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )
                    ),
                  ],
                )
            )),
        Padding(
            padding: EdgeInsets.only(left: 0, top: 5,bottom: 15),
            child: IconButton(
              //color: Colors.deepPurple,
              icon: SvgPicture.asset(IconAssets.deleteIcon),
              onPressed: () {
                //CustomToast.showCustomToast(context, "Deleted ${list.statusTitle}");
                setState(() {
                  listData.removeAt(index);
                });
              },
            )),
      ],
      items: items,
    );
  }

  Widget _createAddBoardButton(BuildContext context) {
    return BoardList(
      //onStartDragList: (int listIndex) {},
      //onTapList: (int listIndex) async {},
      //onDropList: (int listIndex, int oldListIndex) {},
      headerBackgroundColor: ColorPalettes.white,
      backgroundColor: ColorPalettes.lightBG,
      header: [
        Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 0, top: 5,bottom: 15),
                child: Container(
                    padding: EdgeInsets.only(top: 7, bottom: 14, left: 0, right: 0),
                    child: Material(
                      color: ColorPalettes.white,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        child: DottedBorder(
                          dashPattern: [5, 5, 5, 5],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(14),
                          color: ColorPalettes.purpleGreyStroke,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            child: Container(
                              height: 150,
                              //width: Sizes.width(context) * .88,
                              child: Center(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          border: Border.all(width: 1, color: ColorPalettes.greyStroke)),
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: SvgPicture.asset(IconAssets.addIconWhite)
                                      )
                                  )
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigation.intent(context, ColumnFormPage.routeName);
                        },
                      ),
                    )
                )
            )),
      ],
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
/*

  navigateToSuccessLeadPage(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SuccessfulLeadPage(clienId)),
    );

    print('ahahaha $result');
  }
*/


}
