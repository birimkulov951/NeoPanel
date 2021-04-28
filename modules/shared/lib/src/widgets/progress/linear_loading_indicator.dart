import 'package:flutter/material.dart';

import '../../../shared.dart';

class LinearLoadingIndicator extends StatefulWidget {

  const LinearLoadingIndicator({Key key}) : super(key: key);

  @override
  _LinearLoadingIndicator createState() => _LinearLoadingIndicator();
}

class _LinearLoadingIndicator extends State<LinearLoadingIndicator> with TickerProviderStateMixin {

  AnimationController colorAnimationController;

  //AnimationController indicatorController;

  @override
  void initState() {
    colorAnimationController = AnimationController(duration: new Duration(milliseconds: 800), vsync: this);
    colorAnimationController.repeat();

   /* indicatorController = AnimationController(
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
    return Container(
      width: Sizes.width(context),
      child: LinearProgressIndicator(
        //value: indicatorController.value,
        valueColor: colorAnimationController.drive(ColorTween(begin: ColorPalettes.lightPrimary, end: ColorPalettes.lightAccent),),
        //minHeight: 10,
      ),
    );
  }

}
