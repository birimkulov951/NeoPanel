import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared.dart';

class CoursesTabShimmer extends StatelessWidget {

  final double height;

  CoursesTabShimmer(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        baseColor: ColorPalettes.greyBg,
        highlightColor: ColorPalettes.white,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            reverse: false,
            itemCount: 6,
            itemBuilder: (_, index) {
              if (index == 0) {
                return Container(
                  height: 8,
                  width: 80,
                  margin: EdgeInsets.only(left: 18, right: 20, top:15, bottom: 15),
                  decoration: BoxDecoration(
                      color: ColorPalettes.greyBg,
                      borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                );
              } else {
                return Container(
                  height: 8,
                  width: 80,
                  margin: EdgeInsets.only(left: 20, right: 20, top:15, bottom: 15),
                  decoration: BoxDecoration(
                      color: ColorPalettes.greyBg,
                      borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                );
              }
            },
          )
        ),
      ),
    );
  }
}

