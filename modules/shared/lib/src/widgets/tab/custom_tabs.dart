import 'dart:async';
import '../../../shared.dart';

import 'package:flutter/material.dart';

class CustomTabs extends StatefulWidget {
  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  final List<String> names = <String>[
    'Алиева',
    'Алиева',
    'Алиева',
    'Алиева ',
    'Алиева'
  ];
  final List<String> phones = <String>[
    '+996(700)700-707',
    '+996(700)700-707',
    '+996(700)700-707',
    '+996(700)700-707',
    '+996(700)700-707'
  ];
  final List<String> emails = <String>[
    'cms.neolabs@gmail.com',
    'cms.neolabs@gmail.com',
    'cms.neolabs@gmail.com',
    'cms.neolabs@gmail.com',
    'cms.neolabs@gmail.com'
  ];

  int _selectedPage = 0;
  //String _selectedPageName;
  PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appBarHeight = AppBar().preferredSize.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: Container(
                child: SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _changePage(0);
                    },
                    child: Padding(
                        padding: EdgeInsets.all(11),
                        child: Text(
                          'Суперадмин',
                          style: TextStyle(
                            color: _selectedPage == 0
                                ? ColorPalettes.textColorBlack
                                : ColorPalettes.textColorGrey,
                            fontFamily: 'Golos',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      _changePage(1);
                    },
                    child: Padding(
                        padding: EdgeInsets.all(11),
                        child: Text(
                          'Админ',
                          style: TextStyle(
                            color: _selectedPage == 1
                                ? ColorPalettes.textColorBlack
                                : ColorPalettes.textColorGrey,
                            fontFamily: 'Golos',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      _changePage(2);
                    },
                    child: Padding(
                        padding: EdgeInsets.all(11),
                        child: Text(
                          'СММ Агент',
                          style: TextStyle(
                            color: _selectedPage == 2
                                ? ColorPalettes.textColorBlack
                                : ColorPalettes.textColorGrey,
                            fontFamily: 'Golos',
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        )),
                  ),
                ],
              ),
            )),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                Timer(
                  Duration(milliseconds: 600),
                  () => setState(() {
                    _selectedPage = index;
                  }),
                );
              },
              children: [
                _getSuperAdmins(context),
                _getSuperAdmins(context),
                _getSuperAdmins(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  _getSuperAdmins(BuildContext context) {
    var appBarHeight = AppBar().preferredSize.height;
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: Container(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        reverse: false,
        itemCount: names.length,
        itemBuilder: (_, index) => Card(
          margin: EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            top: 7.0,
            bottom: 7.0,
          ),
          elevation: 0,
          color: ColorPalettes.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(width: 1, color: ColorPalettes.greyBg)),
          child: Padding(
              padding: const EdgeInsets.only(
                left: 14.0,
                right: 14.0,
                top: 14.0,
                bottom: 7.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              minRadius: 50,
                              backgroundColor: ColorPalettes.iconGreen,
                              child: Text(
                                'A',
                                style: TextStyle(
                                    fontFamily: 'Golos',
                                    color: ColorPalettes.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w500),
                              )),
                          Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .translate('cityLetter'),
                                        style: TextStyle(
                                            height: 1.5,
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        'Bishkek',
                                        style: TextStyle(
                                            height: 1.5,
                                            color: ColorPalettes.textColorGrey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        names[index],
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        'Алия',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        'Алиевна',
                                        style: TextStyle(
                                            height: 1.5,
                                            fontFamily: 'Golos',
                                            color: ColorPalettes.textColorBlack,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${phones[index]}',
                    style: TextStyle(
                        fontFamily: 'Golos',
                        color: ColorPalettes.textColorBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${emails[index]}',
                    style: TextStyle(
                        fontFamily: 'Golos',
                        color: ColorPalettes.textColorBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
        ),
      )),
    );
  }
}
