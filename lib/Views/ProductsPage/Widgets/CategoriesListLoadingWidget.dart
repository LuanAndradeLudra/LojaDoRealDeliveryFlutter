import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget categoriesListLoadingWidget() => new Container(
  height: 90,
  child: Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.white,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (_, index) {
        return Padding(padding: EdgeInsets.only(right: 6), child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 48.0,
              height: 48.0,
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 8.0,
                  color: Colors.black54,
                ),
                SizedBox(height: 6,),
                Container(
                  width: 60.0,
                  height: 8.0,
                  color: Colors.black54,
                ),
                SizedBox(height: 6,),
                Container(
                  width: 50.0,
                  height: 8.0,
                  color: Colors.black54,
                ),
              ],
            ),
          ],
        ),);
      },
    ),
  ),
);
