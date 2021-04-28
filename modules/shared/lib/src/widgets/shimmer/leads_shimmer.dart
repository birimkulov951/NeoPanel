import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared.dart';

class LeadsShimmer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorPalettes.greyBg,
      highlightColor: ColorPalettes.white,
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 0),
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              reverse: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i)  =>
                  listItems(context, (i-3)*-1)
          )
      ),
    );
  }

  Widget listItems(BuildContext context, int itemCount) {
    return SingleChildScrollView(
      child: Container(
        width: Sizes.width(context) * .86,
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Sizes.width(context) * .4,
                  height: 20,
                  decoration: BoxDecoration(
                      color: ColorPalettes.greyBg,
                      borderRadius: BorderRadius.all(Radius.circular(3))
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: ColorPalettes.greyBg,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            ListView.builder(
              shrinkWrap: true,
              reverse: false,
              itemCount: itemCount,
              itemBuilder: (_, __) => Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: 150,
                  margin: EdgeInsets.fromLTRB(2, 8, 2, 6),
                  decoration: BoxDecoration(
                      color: ColorPalettes.greyBg,
                      borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
