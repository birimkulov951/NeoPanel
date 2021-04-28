import 'package:shared/shared.dart';
import 'package:core/core.dart';
import 'package:neopanel/ui/notifications_page.dart';
import 'package:neopanel/ui/settings/city_form_page.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CitiesSettingsPage extends StatefulWidget {
  static const routeName = "/citiesSettingsPage";

  const CitiesSettingsPage({Key key}) : super(key: key);

  _CitiesSettingsPage createState() => _CitiesSettingsPage();
}

class _CitiesSettingsPage extends State<CitiesSettingsPage> {


  final List<String> cities = <String>[];


  @override
  void initState() {
    context.read<CityBloc>().add(GetCities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(context),
        body: _getCities(context)
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
          AppLocalizations.of(context).translate('settings'),
        style: TextStyle(
          color: ColorPalettes.textColorBlack,
          fontFamily: 'Golos',
          fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(IconAssets.cityIconGreen),
            onPressed: () {
              Navigator.pop(context);
            },
        ),
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

  _getCities(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: BlocBuilder<CityBloc, CityState>(
          builder: (context, state) {
            print('State is $state');
            if (state is CityHasData) {

              return Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  itemCount: state.citiesResult.results.length + 1,
                  itemBuilder: (context, index) {
                    if (index != state.citiesResult.results.length) {
                      return Card(
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
                              side: BorderSide(width: 1, color: ColorPalettes.purpleGreyStroke)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            onTap: () {
                              CustomToast.showCustomToast(context, "City list index $index");
                            },
                            child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 14.0,
                                  right: 14.0,
                                  top: 11.0,
                                  bottom: 14.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${AppLocalizations.of(context).translate('cityLetter')}${state.citiesResult.results[index].name??''}',
                                          style: TextStyle(
                                              fontFamily: 'Golos',
                                              height: 1.5,
                                              color: ColorPalettes.textColorBlack,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '${state.citiesResult.results[index].createDate.substring(8,10)??''}.${state.citiesResult.results[index].createDate.substring(5,7)??''}.${state.citiesResult.results[index].createDate.substring(0,4)??''}',
                                          style: TextStyle(
                                              fontFamily: 'Golos',
                                              height: 1.5,
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context).translate('groupsInBranch:'),
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          state.citiesResult.results[index].groupsCount.toString()??AppLocalizations.of(context).translate('notIndicated'),
                                          style: TextStyle(
                                              height: 1.5,
                                              fontFamily: 'Golos',
                                              color: ColorPalettes.textColorBlack,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                            ),
                          )
                      );
                    } else {
                      return Container(
                          padding: EdgeInsets.only(
                              top: 7, bottom: 14, left: 18, right: 18),
                          child: Material(
                            child: InkWell(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(14)),
                              child: DottedBorder(
                                dashPattern: [5, 5, 5, 5],
                                borderType: BorderType.RRect,
                                radius: Radius.circular(14),
                                color: ColorPalettes.purpleGreyStroke,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(14)),
                                  child: Container(
                                    height: 72,
                                    width: Sizes.width(context) * .88,
                                    child: Center(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(14),
                                                border: Border.all(width: 1,
                                                    color: ColorPalettes
                                                        .greyStroke)),
                                            child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: SvgPicture.asset(
                                                    IconAssets.addIconWhite)
                                            )
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigation.intent(
                                    context, CityFormPage.routeName);
                              },
                            ),
                          )
                      );
                    }
                  },
                ),
              );
            }
            else if (state is CityNoData) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate(
                    'noDataAvailable'),
              );
            }
            else if (state is CityNoInternetConnection) {
              return NoInternetWidget(
                message: AppLocalizations.of(context).translate(
                    'noInternetConnection'),
              );
            } else if (state is CityError) {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate('unknownError'),
              );
            } else if (state is CityLoading) {
              return ListShimmer(72);
            } else {
              return CustomErrorWidget(
                message: AppLocalizations.of(context).translate('unknownError'),
              );
            }
          },
        )
    );
  }

}
