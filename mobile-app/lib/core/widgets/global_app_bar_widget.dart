import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    ));
  }
}
