import '../../../shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFieldGrey extends StatefulWidget {

  final String text;
  final bool isRedBorder;
  final Function onEditingComplete;
  final focusNode;
  final hint;
  final keyboardType;
  final textEditingController;
  final maxLines;


  //final obscureText;

  const CustomTextFieldGrey({Key key, this.text, this.isRedBorder = false, this.focusNode, this.hint, this.keyboardType, this.textEditingController, this.maxLines, this.onEditingComplete}) : super(key: key);

  @override
  _CustomTextFieldGrey createState() => _CustomTextFieldGrey();
}

class _CustomTextFieldGrey extends State<CustomTextFieldGrey> {

  bool _isHiddenObscureText = true;

  void _toggleVisibility() {
    setState(() {
      _isHiddenObscureText = !_isHiddenObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context) * .9,
      //height: Sizes.height(context) / 7,
      child: TextField(
        maxLines: widget.maxLines,
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(

          contentPadding: EdgeInsets.only(left: 18, top: 4, bottom: 4),
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: widget.isRedBorder ? ColorPalettes.red : ColorPalettes.greyStroke,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: ColorPalettes.deepPurple,
            width: 1.0,
          ),
        ),
        suffixIcon:
        widget.text == AppLocalizations.of(context).translate('password') ? IconButton(onPressed: _toggleVisibility,
                icon: _isHiddenObscureText ? SvgPicture.asset(IconAssets.invisibleIcon) : SvgPicture.asset(IconAssets.visibleIcon),
        ) : null,
      ),
      obscureText: widget.text == AppLocalizations.of(context).translate('password') ? _isHiddenObscureText : false,
    ));
  }
}