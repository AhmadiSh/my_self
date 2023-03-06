// import 'package:flutter/material.dart';
// import 'package:liom_app/core/theme/style/color_palatte.dart';

import 'package:flutter/material.dart';
import 'package:my_self/core/theme/style/color_palatte.dart';

class Modal extends StatelessWidget {
  const Modal({
    super.key,
    required this.child,
    this.margin = const EdgeInsets.fromLTRB(8, 0, 8, 10),
    this.backgroundColor,
    this.borderRadius,
    this.constraints,
  });
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets margin;
  final BoxConstraints? constraints;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Container(
        padding: MediaQuery.of(context).viewInsets.add(EdgeInsets.zero),
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorPalette.of(context).scaffoldBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: constraints,
        child: SingleChildScrollView(
          child: child,
        ),
      );
}
