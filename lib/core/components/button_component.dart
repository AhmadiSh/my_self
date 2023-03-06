import 'package:flutter/material.dart';
import 'package:my_self/core/theme/style/color_palatte.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    this.width = double.infinity,
    this.height = 48,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.borderSide = BorderSide.none,
    this.enabled = true,
    this.loading = false,
    this.color,
    this.splashColor,
    this.loadingColor,
    this.maxWidth,
    this.minwidth,
    this.margin,
    Key? key,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget child;
  final Function onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BorderSide borderSide;
  final bool enabled;
  final bool loading;
  final Color? splashColor;
  final Color? loadingColor;
  final double? maxWidth;
  final double? minwidth;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        margin: margin,
        child: ElevatedButton(
          onPressed: !loading && enabled
              ? () {
                  onPressed();
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              : null,
          style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => !enabled
                      ? ColorPalette.of(context).disableColor
                      : color ?? ColorPalette.of(context).primary,
                ),
                overlayColor: splashColor == null
                    ? null
                    : MaterialStateProperty.resolveWith((states) =>
                        states.contains(MaterialState.disabled)
                            ? Colors.transparent
                            : ColorPalette.of(context).primary),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(6),
                    side: (enabled && !loading)
                        ? borderSide
                        : borderSide.copyWith(
                            color: ColorPalette.of(context).border,
                          ),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
          child: loading
              ? Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        loadingColor ??
                            ColorPalette.of(context).scaffoldBackground,
                      ),
                    ),
                  ),
                )
              : child,
        ),
      );
}
