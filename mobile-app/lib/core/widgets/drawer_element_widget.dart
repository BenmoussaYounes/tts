import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget {
  const DrawerElement(
      {super.key,
      this.selected,
      required this.leadingIcon,
      required this.title,
      this.onTap});

  final bool? selected;
  final IconData leadingIcon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected ?? false,
      leading: Icon(leadingIcon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
