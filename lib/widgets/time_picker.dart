import 'package:blink_alarm_clock_app/Providers/timer_provider.dart';
import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showTimePickerDialog(BuildContext context, TimerProvider timerProvider) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              kDarkGrey.withOpacity(0.7),
              kDarkBlue.withOpacity(0.7)
            ],
          ),
        ),
        height: 300,
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          initialTimerDuration: Duration(seconds: timerProvider.remainingTime),
          onTimerDurationChanged: (Duration newDuration) {
            if (newDuration.inSeconds > 0) {
              timerProvider.setTime(newDuration.inSeconds);
            }
          },
        ),
      );
    },
  );
}
