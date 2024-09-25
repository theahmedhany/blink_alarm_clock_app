import 'package:blink_alarm_clock_app/Providers/timer_provider.dart';
import 'package:blink_alarm_clock_app/widgets/screen_title.dart';
import 'package:blink_alarm_clock_app/widgets/timer_controls.dart';
import 'package:blink_alarm_clock_app/widgets/timer_display.dart';
import 'package:blink_alarm_clock_app/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ScreenTitle(
          title: 'Timer',
          image: 'assets/images/timer_icon.png',
        ),
        const SizedBox(height: 150),
        TimerDisplay(
          remainingTime: timerProvider.remainingTime,
          initialTime: timerProvider.initialTime,
          onTimeTap: () => showTimePickerDialog(context, timerProvider),
        ),
        const SizedBox(height: 100),
        TimerControls(
          isRunning: timerProvider.isRunning,
          onReset: timerProvider.resetTimer,
          onStartPause: timerProvider.isRunning
              ? timerProvider.pauseTimer
              : timerProvider.startTimer,
        ),
      ],
    );
  }
}
