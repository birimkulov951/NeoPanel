import 'package:flutter/material.dart';

import '../../../shared.dart';

class LoadingIndicator extends StatefulWidget {

  const LoadingIndicator({Key key}) : super(key: key);

  @override
  _LoadingIndicator createState() => _LoadingIndicator();
}

class _LoadingIndicator extends State<LoadingIndicator> with TickerProviderStateMixin {

  AnimationController colorAnimationController;
  //AnimationController indicatorController;

  @override
  void initState() {
    colorAnimationController = AnimationController(duration: new Duration(milliseconds: 800), vsync: this);
    colorAnimationController.repeat();

    /*indicatorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    indicatorController.repeat(reverse: true);*/
    super.initState();
  }

  @override
  void dispose() {
    colorAnimationController.dispose();
    //indicatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
        //value: indicatorController.value,
        valueColor: colorAnimationController.drive(ColorTween(begin: ColorPalettes.lightPrimary, end: ColorPalettes.lightAccent)
        )
    ));
  }

}
