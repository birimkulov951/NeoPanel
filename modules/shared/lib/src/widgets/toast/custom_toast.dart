import 'dart:async';

import '../../../shared.dart';

import 'package:flutter/material.dart';

class CustomToast {
  static Timer toastTimer;
  static OverlayEntry _overlayEntry;

  static void showCustomToast(BuildContext context,
      String message) {

    if (toastTimer == null || !toastTimer.isActive) {
      _overlayEntry = createOverlayEntry(context, message);
      Overlay.of(context).insert(_overlayEntry);
      toastTimer = Timer(Duration(seconds: 2), () {
        if (_overlayEntry != null) {
          _overlayEntry.remove();
        }
      });
    }

  }

  static OverlayEntry createOverlayEntry(BuildContext context,
      String message) {

    return OverlayEntry(
      builder: (context) => Positioned(
          bottom: 90.0,
          left: 15,
          width: Sizes.width(context) * .9,
          child: ToastAnimation(Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding:
              EdgeInsets.only(left: 10, right: 10,
                  top: 13, bottom: 10),
              decoration: BoxDecoration(
                  color: ColorPalettes.textColorBlack,
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                  alignment: Alignment.center,
                  child:
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Golos',
                      color: Color(0xFFFFFFFF),
                    ),
                  )
              ),
            ),
          ),
          )),
    );
  }
}