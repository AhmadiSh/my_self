import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    this.height,
    this.width,
    this.margin = EdgeInsetsDirectional.zero,
    this.radius = 10,
  });
  final double? height;
  final double? width;
  final EdgeInsetsDirectional margin;

  final double radius;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Shimmer.fromColors(
      baseColor: const Color(0x08000000),
      highlightColor: const Color(0x12000000),
      direction: ShimmerDirection.rtl,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
