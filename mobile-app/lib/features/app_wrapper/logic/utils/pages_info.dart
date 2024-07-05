import 'package:flutter/widgets.dart';

import '../../../../core/enums/drawer_pages_enums.dart';
import '../../../about/ui/screens/about_screen.dart';
import '../../../saved_speeches/ui/screens/saved_speeches_screen.dart';
import '../../../settings/ui/screens/settings_screen.dart';
import '../../../text_to_speech/ui/text_to_speech_screen.dart';
import '../../../text_to_speech_evaluation/ui/screens/start_evaluation_sreen.dart';

({
  String selectedPageAppBarTitle,
  Widget selectedPage,
  DrawerPages selectedPageIndex
}) ttsPageInfo = (
  selectedPageAppBarTitle: "Text To Speech",
  selectedPage: const TextToSpeechScreen(),
  selectedPageIndex: DrawerPages.tts
);

({
  String selectedPageAppBarTitle,
  Widget selectedPage,
  DrawerPages selectedPageIndex
}) savedSpeechPageInfo = (
  selectedPageAppBarTitle: "Saved Speeches",
  selectedPage: const SavedSpeechesScreen(),
  selectedPageIndex: DrawerPages.savedSpeeches
);

({
  String selectedPageAppBarTitle,
  Widget selectedPage,
  DrawerPages selectedPageIndex
}) evaluationPageInfo = (
  selectedPageAppBarTitle: "Evaluation",
  selectedPage: const StartEvaluationScreen(),
  selectedPageIndex: DrawerPages.evaluation
);

({
  String selectedPageAppBarTitle,
  Widget selectedPage,
  DrawerPages selectedPageIndex
}) settingsPageInfo = (
  selectedPageAppBarTitle: "Settings",
  selectedPage: const SettingsScreen(),
  selectedPageIndex: DrawerPages.settings
);

({
  String selectedPageAppBarTitle,
  Widget selectedPage,
  DrawerPages selectedPageIndex
}) aboutPageInfo = (
  selectedPageAppBarTitle: "About",
  selectedPage: const AboutScreen(),
  selectedPageIndex: DrawerPages.about
);
