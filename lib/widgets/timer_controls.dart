import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:flutter/material.dart';

class TimerControls extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onReset;
  final VoidCallback onStartPause;

  const TimerControls({
    Key? key,
    required this.isRunning,
    required this.onReset,
    required this.onStartPause,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildControlButton(
          icon: Icons.close,
          onPressed: onReset,
          color: kMediumGrey,
        ),
        const SizedBox(width: 60),
        _buildControlButton(
          icon: isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
          onPressed: onStartPause,
          color: kLightBlueishPurple,
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 35,
          color: kLightWhite,
        ),
      ),
    );
  }
}
