import '../../../shared.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmer extends StatelessWidget {

  final double height;

  ListShimmer(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Shimmer.fromColors(
        baseColor: ColorPalettes.greyBg,
        highlightColor: ColorPalettes.white,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (_, __) => Container(
            height: height,
            margin: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
                color: ColorPalettes.greyBg,
                borderRadius: BorderRadius.all(Radius.circular(14))
            ),
          ),
        ),
      ),
    );
  }
}
