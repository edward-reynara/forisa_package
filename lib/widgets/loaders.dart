import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

import '../configs/config_colors.dart';
import 'dividers.dart';

Widget loadMoreListLoader({bool isLoadingMoreData = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Opacity(
        opacity: isLoadingMoreData ? 1.0 : 0.0,
        child: SpinKitCircle(
          color: ConfigColor.primaryColor,
        ),
      ),
    ),
  );
}

Widget futureLoader() => SpinKitDualRing(
      color: ConfigColor.secondaryColor,
    );
Shimmer roundmenuLoader() => Shimmer.fromColors(
      baseColor: ConfigColor.shimmerBaseColor,
      highlightColor: ConfigColor.shimmerHighlightColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ConfigColor.shimmerInitColor,
            ),
          ),
          Container(
            height: 10.0,
            color: ConfigColor.shimmerInitColor,
          ),
        ],
      ),
    );

Shimmer horizontalBoxLoader() => Shimmer.fromColors(
      baseColor: ConfigColor.shimmerBaseColor,
      highlightColor: ConfigColor.shimmerHighlightColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 20.0,
            color: ConfigColor.shimmerInitColor,
          ),
          dividerForm(),
          Container(
            width: 150.0,
            height: 100.0,
            margin: const EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              color: ConfigColor.shimmerInitColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
