import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavigationDestinationElement extends StatelessWidget {
  const AppNavigationDestinationElement(
      {super.key, required this.iconPath, required this.label});
  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        iconPath,
        height: 24.0,
        width: 24.0,
      ),
      label: label,
    );
  }
}
