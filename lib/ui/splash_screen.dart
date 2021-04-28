import 'dart:async';

import 'package:shared/shared.dart';
import 'package:core/core.dart';

import 'package:neopanel/ui/authorization/authorization_page.dart';
import 'package:neopanel/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info/package_info.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = "/splashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPrefHelper prefHelper = SharedPrefHelper();
  bool _isAuthorized = false;

  Future<String> _getVersion() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info.version;
  }

  _startSplashScreen() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
    if (!_isAuthorized) {
      Navigation.intentWithClearAllRoutes(context, AuthorizationPage.routeName);
    } else {
      Navigation.intentWithClearAllRoutes(context, MainPage.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
        builder: _buildChild,
    );
  }

  Widget _buildChild(BuildContext context, SplashState state) {
    context.select((SplashBloc splashBloc) => splashBloc.add(GetSplash()));
    if(state is SplashState) {
      print("_isAuthorized = ${state.isAuthorized}");
      _isAuthorized = state.isAuthorized;
    }
    return Scaffold(
      backgroundColor: ColorPalettes.white,
      body: SafeArea(
        child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: Sizes.width(context) / 3,
                  child: SvgPicture.asset(
                      IconAssets.logoIcon,
                      width: Sizes.width(context) * .9),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FutureBuilder<String>(
                  future: _getVersion(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    var verInfo = "";
                    if (snapshot.hasData) {
                      verInfo = "version ${snapshot.data}";
                    }
                    return Container(
                      margin: EdgeInsets.only(bottom: Sizes.dp30(context)),
                      child: Text(
                        verInfo,
                        style: TextStyle(
                            color: ColorPalettes.textColorGrey,
                            fontFamily: 'Golos',
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
