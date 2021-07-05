import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget productsListLoadingWidget() => new Shimmer.fromColors(
  direction: ShimmerDirection.ttb,
  baseColor: Colors.grey,
  highlightColor: Colors.white,
  child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(right: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                width: 130,
                height: 130,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 16,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 130,
                    height: 14,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 110,
                    height: 10,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
);
