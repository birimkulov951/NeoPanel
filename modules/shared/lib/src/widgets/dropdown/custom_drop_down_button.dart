import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared.dart';

class CustomDropdownButton extends StatefulWidget {

  final String hintText;
  final String value;
  final List listItems;
  final focusNode;
  final Function onChanged;


  CustomDropdownButton( {Key key, @required this.value, @required this.listItems, this.hintText, this.focusNode, this.onChanged}) : super(key: key);

  @override
  _CustomDropdownButton createState() => _CustomDropdownButton();
}

class _CustomDropdownButton extends State<CustomDropdownButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sizes.width(context) * .9,
        decoration: BoxDecoration(
            border: Border.all(
                color: ColorPalettes.deepPurple,
                width: 1
            ),
            borderRadius: BorderRadius.circular(6)
        ),
      child: Padding(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: DropdownButton(
          focusNode: widget.focusNode,
          hint: Text(
            widget.hintText,
            style:TextStyle(
                fontFamily: 'Golos',
                fontSize: 15,
                color: ColorPalettes.textColorGrey
            ),
          ),
          dropdownColor: ColorPalettes.white,
          icon: SvgPicture.asset(IconAssets.dropDownIcon),
          //Icon(Icons.arrow_drop_down_outlined, size: 35, color: ColorPalettes.textColorGrey),
          isExpanded: true,
          underline: SizedBox(),
          style: TextStyle(
              fontFamily: 'Golos',
              fontSize: 15,
              color: ColorPalettes.textColorBlack
          ),
          value: widget.value,
          onChanged: widget.onChanged,
          items: widget.listItems.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList(),
        ),
      ));



  }
}