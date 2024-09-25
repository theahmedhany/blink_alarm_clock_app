import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:blink_alarm_clock_app/models/enums_menu_type.dart';
import 'package:blink_alarm_clock_app/models/menu_info.dart';
import 'package:blink_alarm_clock_app/models/menu_items.dart';
import 'package:blink_alarm_clock_app/screens/alarm_page.dart';
import 'package:blink_alarm_clock_app/screens/clock_page.dart';
import 'package:blink_alarm_clock_app/screens/stop_watch_page.dart';
import 'package:blink_alarm_clock_app/screens/timer_page.dart';
import 'package:blink_alarm_clock_app/widgets/menu_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                const SizedBox(height: 15),
                SafeArea(
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: menuItems
                      .map(
                        (e) => MenuButtons(
                          image: e.imageSource!,
                          title: e.title!,
                          currentMenuInfo: e,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return const ClockPage();
                } else if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                } else if (value.menuType == MenuType.timer) {
                  return const TimerPage();
                } else {
                  return const StopWatchPage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
