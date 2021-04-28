import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
            color: Colors.black,
            fontFamily: 'Golos',
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
