import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:blink_alarm_clock_app/widgets/show_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

deleteAlarm(BuildContext context, String id) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kDarkGrey.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: Text(
          textAlign: TextAlign.center,
          'Delete Alarm',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: kLightWhite,
          ),
        ),
        content: Text(
          'Are you sure you want to delete it?',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: kLightWhite,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kLightBlueishPurple.withOpacity(0.2),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kLightWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    'Cancel',
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  try {
                    FirebaseFirestore.instance
                        .collection('alarm')
                        .doc(id)
                        .delete();

                    showSnackBar(context, 'Alarm Deleted Successfully.');
                  } catch (e) {
                    showSnackBar(context, e.toString());
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  width: 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kLightBlueishPurple.withOpacity(0.2),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kLightWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    'Delete',
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
