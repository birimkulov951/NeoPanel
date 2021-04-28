import '../../../shared.dart';

import 'package:flutter/material.dart';

class CustomDialogAdditionalSettings extends StatefulWidget {
  final List<String> listData;
  final Function onPressed;

  const CustomDialogAdditionalSettings(
      {Key key, @required this.listData, this.onPressed})
      : super(key: key);

  _CustomDialogAdditionalSettings createState() =>
      _CustomDialogAdditionalSettings();
}

class _CustomDialogAdditionalSettings
    extends State<CustomDialogAdditionalSettings> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        for (int item = 0; item < widget.listData.length; item++)
          DialogCardItem(
            city: widget.listData[item],
            date: widget.listData[item],
            groupsInBranch: widget.listData[item],
            onPressed: () {
              Navigator.pop(context, widget.listData[item].toString());
            },
          ),
        CustomButtonPurpleSmall(
          text: AppLocalizations.of(context).translate('addingCity'),
          onPressed: widget.onPressed,
        )
      ],
    );
  }
}
