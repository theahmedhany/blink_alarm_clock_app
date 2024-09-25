import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blink_alarm_clock_app/widgets/alarm_switcher.dart';
import 'package:blink_alarm_clock_app/widgets/delete_alarm.dart';
import 'package:blink_alarm_clock_app/constants/colors.dart';

class AlarmItem extends StatelessWidget {
  final String id;
  final String formattedTime;
  final bool on;
  final Timestamp time;
  final int index;

  const AlarmItem({
    Key? key,
    required this.id,
    required this.formattedTime,
    required this.on,
    required this.time,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> containerGradient =
        gradientColors[index % gradientColors.length];

    Color shadowColor = containerGradient.first;

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.7),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
        gradient: LinearGradient(
          colors: containerGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.label,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Alarm',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              AlarmSwitcher(on, id, time),
            ],
          ),
          const Text(
            'Everyday',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedTime,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  deleteAlarm(context, id);
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
