import 'package:blink_alarm_clock_app/constants/colors.dart';
import 'package:blink_alarm_clock_app/models/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons({
    super.key,
    required this.image,
    required this.title,
    required this.currentMenuInfo,
  });

  final String image;
  final String title;
  final MenuInfo currentMenuInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Consumer<MenuInfo>(
        builder: (BuildContext context, value, Widget? child) {
          return GestureDetector(
            onTap: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: currentMenuInfo.menuType == value.menuType
                    ? kDarkBlue
                    : Colors.transparent,
              ),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 4.3,
              child: Column(
                children: [
                  Image.asset(
                    currentMenuInfo.imageSource!,
                    scale: 1.5,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentMenuInfo.title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
