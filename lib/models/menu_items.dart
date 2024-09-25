import 'package:blink_alarm_clock_app/models/enums_menu_type.dart';
import 'package:blink_alarm_clock_app/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(
    MenuType.clock,
    title: 'Clock',
    imageSource: 'assets/images/clock_icon.png',
  ),
  MenuInfo(
    MenuType.alarm,
    title: 'Alarm',
    imageSource: 'assets/images/alarm_icon.png',
  ),
  MenuInfo(
    MenuType.timer,
    title: 'Timer',
    imageSource: 'assets/images/timer_icon.png',
  ),
  MenuInfo(
    MenuType.stopwatch,
    title: 'Stop Watch',
    imageSource: 'assets/images/stopwatch_icon.png',
  ),
];
