import 'package:flutter/material.dart';
import 'package:text_and_speech/core/enums/drawer_pages_enums.dart';

import '../../../../core/widgets/drawer_element_widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
      {super.key, required this.onTap, required this.selectedPageIndex});

  final DrawerPages selectedPageIndex;
  final Function(DrawerPages page) onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding:
            EdgeInsets.zero, // Important: Remove any padding from the ListView.
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Text and Speech App!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          DrawerElement(
            selected: DrawerPages.tts == selectedPageIndex ? true : false,
            leadingIcon: Icons.record_voice_over,
            title: 'Text To Speech',
            onTap: () => onTap(DrawerPages.tts),
          ),
          DrawerElement(
              selected:
                  DrawerPages.savedSpeeches == selectedPageIndex ? true : false,
              leadingIcon: Icons.save,
              title: 'Saved Speeches',
              onTap: () => onTap(DrawerPages.savedSpeeches)),
          DrawerElement(
            selected:
                DrawerPages.evaluation == selectedPageIndex ? true : false,
            leadingIcon: Icons.speaker_notes,
            title: 'Evaluation',
            onTap: () => onTap(DrawerPages.evaluation),
          ),
          DrawerElement(
              selected:
                  DrawerPages.settings == selectedPageIndex ? true : false,
              leadingIcon: Icons.settings,
              title: 'Settings',
              onTap: () => onTap(DrawerPages.settings)),
          DrawerElement(
              selected: DrawerPages.about == selectedPageIndex ? true : false,
              leadingIcon: Icons.info,
              title: 'About',
              onTap: () => onTap(DrawerPages.about)),
        ],
      ),
    );
  }
}
