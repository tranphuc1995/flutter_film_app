import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black45,
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.black45),
        ));
  }
}
