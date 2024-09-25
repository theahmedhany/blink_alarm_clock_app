import 'dart:async';
import 'package:blink_alarm_clock_app/widgets/reset_button.dart';
import 'package:blink_alarm_clock_app/widgets/screen_title.dart';
import 'package:blink_alarm_clock_app/widgets/stop_watch_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  late Stopwatch stopwatch;
  late Timer time;

  void handleStartStop() {
    setState(() {
      if (stopwatch.isRunning) {
        stopwatch.stop();
      } else {
        stopwatch.start();
      }
    });
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = ((milli % 1000) ~/ 10).toString().padLeft(2, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60 % 60).toString().padLeft(2, "0");
    String hours = ((milli ~/ 1000) ~/ 3600).toString().padLeft(2, "0");

    return "$hours:$minutes:$seconds.$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    time = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ScreenTitle(
          title: 'Stop Watch',
          image: 'assets/images/stopwatch_icon.png',
        ),
        const SizedBox(height: 150),
        StopWatchDisplay(
          displayTime: returnFormattedText(),
          onPressed: handleStartStop,
        ),
        const SizedBox(height: 50),
        ResetButton(
          onPressed: () {
            setState(() {
              stopwatch.reset();
            });
          },
        ),
      ],
    );
  }
}
