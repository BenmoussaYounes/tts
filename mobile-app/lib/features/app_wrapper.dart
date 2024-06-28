import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/helpers/path_strings/app_icons.dart';
import '../core/routing/routes.dart';
import 'speech_to_text/logic/cubit/speech_to_text_cubit.dart';
import 'speech_to_text/ui/speech_to_text.dart';
import 'text_to_speech/logic/cubit/text_to_speech_cubit.dart';
import 'text_to_speech/ui/text_to_speech_screen.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  String title = 'Text to Speech';
  int _selectedPage = 0;
  final List _pages = [
    BlocProvider(
        create: (_) => TextToSpeechCubit(), child: const TextToSpeechScreen()),
    BlocProvider(
        create: (_) => SpeechToTextCubit(), child: const SpeechToText())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
              child: Text(
                'Welcome to Text and Speech App!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListTile(
              selected: true,
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.save),
              title: const Text('Saved Speeches'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.speaker_notes),
              title: const Text('Evaluated generated Speeches(MOS)'),
              onTap: () {
                Navigator.pushNamed(context, Routes.mosScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {},
            )
          ],
        ),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPage,
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              title = 'Text to Speech';
              break;
            case 1:
              title = 'Speech to Text';
              break;
          }
          setState(() {
            _selectedPage = index;
          });
        },
        animationDuration: const Duration(seconds: 5),
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              AppIconsStrings.ttsIcon,
              height: 24.0,
              width: 24.0,
            ),
            label: 'TTS',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(AppIconsStrings.sttIcon,
                height: 24.0, width: 24.0),
            label: 'STT',
          ),
        ],
      ),
    );
  }
}
