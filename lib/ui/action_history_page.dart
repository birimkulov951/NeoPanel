import 'package:shared/shared.dart';

import 'package:flutter/material.dart';

class ActionHistoryPage extends StatefulWidget {
  static const routeName = "/actionHistoryPage";

  const ActionHistoryPage({Key key}) : super(key: key);

  _ActionHistoryPage createState() => _ActionHistoryPage();
}

class _ActionHistoryPage extends State<ActionHistoryPage> {

  final List<String> names = <String>['Таалайбек улуу Бекболот', 'Таалайбек улуу Бекболот', 'Таалайбек улуу Бекболот', 'Таалайбек улуу Бекболот', 'Таалайбек улуу Бекболот'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getActionHistory(context),
    );
  }

  _getActionHistory(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      reverse: false,
      itemCount: names.length,
      itemBuilder: (_, index) =>
          Card(
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
                side: BorderSide(width: 1, color: ColorPalettes.boardViewCardStroke)),
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 14.0,
                  right: 14.0,
                  top: 14.0,
                  bottom: 14.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // todo add this ? student : group
                          AppLocalizations.of(context).translate('student'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '24.04.21',
                                style: TextStyle(
                                    height: 1.5,
                                    fontFamily: 'Golos',
                                    color: ColorPalettes.textColorGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                ' | 15:00',
                                style: TextStyle(
                                    height: 1.5,
                                    fontFamily: 'Golos',
                                    color: ColorPalettes.textColorGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                        child: Text(
                          '${names[index]}',
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        )
                    ),
                    Container(
                      transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
                      child: Card(
                        elevation: 0,
                        color: Color(0xFFFDD835),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'JAVA',
                              style: TextStyle(
                                  height: 1.5,
                                  fontFamily: 'Golos',
                                  color: ColorPalettes.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800),
                            )),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).translate('editedBy:'),
                          style: TextStyle(
                              height: 1.5,
                              fontFamily: 'Golos',
                              color: ColorPalettes.textColorGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'TeacherName',
                          style: TextStyle(
                              fontFamily: 'Golos',
                              height: 1.5,
                              color: ColorPalettes.textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
    );
  }

  _getTeachers1(BuildContext context) {
    /* return ListView(
      children: <Widget> [
        Card(
            margin: EdgeInsets.only(
              left: 18.0,
              right: 18.0,
              top: 7.0,
              bottom: 7.0,
            ),
            elevation: 0,
            color: ColorPalettes.boardViewItemColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(width: 1, color: ColorPalettes.greyBG)),
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 14.0,
                  right: 14.0,
                  top: 14.0,
                  bottom: 7.0,
                ),
                child: ExpansionPanelList(
                  elevation: 0,
                  dividerColor: Colors.transparent,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      items[index].isExpanded = !items[index].isExpanded;
                    });
                  },
                  children: items.map((Item item) {
                    return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Text(item.headerCity);
                        },
                        isExpanded: item.isExpanded,
                        body: Text(item.monday)
                    );
                  }).toList(),
                ))

        )],
    );*/

  }
}
