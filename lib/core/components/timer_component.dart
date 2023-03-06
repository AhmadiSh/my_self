import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_self/core/theme/style/color_palatte.dart';

class TimerComponent extends StatefulWidget {
  const TimerComponent({
    super.key,
    required this.seconds,
    this.isEmergency = false,
  });

  final int seconds;
  final bool isEmergency;

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  Timer? countdownTimer;
  late Duration myDuration;
  @override
  void initState() {
    myDuration = Duration(seconds: widget.seconds);
    super.initState();
    startTimer();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Text(
      '$hours:$minutes:$seconds',
      style: Theme.of(context).textTheme.caption?.copyWith(
            color: widget.isEmergency
                ? ColorPalette.of(context).white
                : ColorPalette.of(context).primary,
          ),
    );
  }
}
