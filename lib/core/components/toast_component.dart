import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:my_self/core/theme/style/color_palatte.dart';

enum ToastType { confirm, error, info, warning }

class ToastComponent {
  static CancelFunc? cancelFunc;

  static void show(String title,
      {ToastType type = ToastType.error, bool showCloseButton = false}) {
    if (cancelFunc != null) {
      cancelFunc!.call();
    }
    cancelFunc = BotToast.showCustomText(
      duration: getDuration(title),
      align: AlignmentDirectional.bottomStart,
      toastBuilder: (_) => Builder(builder: (BuildContext context) {
        late Color background;
        late String iconPath;
        late Color color;
        switch (type) {
          case ToastType.error:
            background = ColorPalette.dark.errorContainer;
            break;
          case ToastType.confirm:
            background = ColorPalette.light.success;
            // iconPath = Assets.confirmIc;
            break;
          case ToastType.info:
            background = ColorPalette.of(context).primary;
            // iconPath = Assets.infoCircleIc;
            break;
          case ToastType.warning:
            background = ColorPalette.of(context).info;
            // iconPath = Assets.aleartIc;

            break;
        }

        return GestureDetector(
          onTap: getDuration(title).inMilliseconds > 3000
              ? () {
                  if (cancelFunc != null) {
                    cancelFunc!.call();
                  }
                }
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            padding: const EdgeInsetsDirectional.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: background,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // SvgPicture.asset(
                              //   iconPath,
                              //   color:
                              //       ColorPalette.of(context).scaffoldBackground,
                              // ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  title,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: ColorPalette.of(context)
                                            .scaffoldBackground,
                                      ),
                                  // overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (showCloseButton)
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(end: 8),
                              // child: SvgPicture.asset(
                              //   // Assets.closeIc,
                              //   color:
                              //       ColorPalette.of(context).scaffoldBackground,
                              // ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      wrapToastAnimation:
          (AnimationController controller, CancelFunc cancel, Widget child) =>
              CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
    );
  }

  static Duration getDuration(String? text) {
    int milliseconds = ((text?.length ?? 0) * 48).round();
    milliseconds = milliseconds < 2000 ? 2000 : milliseconds;
    milliseconds = milliseconds > 6000 ? 6000 : milliseconds;
    return Duration(milliseconds: milliseconds);
  }
}

class CustomAnimationWidget extends StatefulWidget {
  const CustomAnimationWidget(
      {required this.controller, required this.child, Key? key})
      : super(key: key);

  final AnimationController controller;
  final Widget child;

  @override
  _CustomAnimationWidgetState createState() => _CustomAnimationWidgetState();
}

class _CustomAnimationWidgetState extends State<CustomAnimationWidget> {
  static final Tween<Offset> tweenOffset = Tween<Offset>(
    begin: const Offset(125, 0),
    end: const Offset(0, 0),
  );

  static final Tween<double> tweenScale = Tween<double>(begin: 0.7, end: 1.0);
  late Animation<double> animation;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: tweenOffset.evaluate(animation),
          child: Transform.scale(
            scale: tweenScale.evaluate(animation),
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        ),
        child: widget.child,
      );
}
