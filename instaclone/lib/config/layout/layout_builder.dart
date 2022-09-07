import 'package:flutter/material.dart';
import 'package:instaclone/constants/app_data.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreensize) {
          //return Webscreen layout
          return webScreenLayout;
        } else {
          //return MobileScreen layout
          return mobileScreenLayout;
        }
      },
    );
  }
}
