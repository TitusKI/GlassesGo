import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassesgo/views/common/values/colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: AppColors.primaryText,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 100.h,
            child: DrawerHeader(
              margin: const EdgeInsets.only(left: 2.0),
              decoration: const BoxDecoration(
                  color: AppColors.primaryBackground,
                  gradient: LinearGradient(colors: [
                    AppColors.primarySecondaryElementText,
                    AppColors.primaryBackground,
                    AppColors.primaryBackground,
                  ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
              child: Container(
                margin: const EdgeInsets.all(11.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 10.0,
                      backgroundImage: AssetImage('assets/icons/profile.jpg'),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Titus",
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            color: AppColors.primarySecondaryElementText,
            thickness: 1.2,
          ),
          drawerTile("settings", 'Settings', () {
            Navigator.of(context).pop();
          }),
          drawerTile("about", 'About us', () {
            Navigator.of(context).pop();
          }),
          drawerTile("rate_us", 'Rate us', () {
            Navigator.of(context).pop();
          }),
          drawerTile("feedback", 'Give feedback', () {
            Navigator.of(context).pop();
          })
        ],
      ),
    );
  }

  Widget drawerTile(String? iconName, String title, void Function() onTile) {
    return ListTile(
      leading: iconName != null ? Icon(getIconData(iconName)) : null,
      title: Text(
        title,
        style: const TextStyle(
            color: AppColors.primaryText, fontWeight: FontWeight.bold),
      ),
      onTap: onTile,
    );
  }

  IconData? getIconData(String iconName) {
    switch (iconName) {
      case "settings":
        return Icons.settings;
      case "about":
        return Icons.info;
      case "rate_us":
        return Icons.rate_review;
      case "feedback":
        return Icons.feedback;
    }
  }
}
