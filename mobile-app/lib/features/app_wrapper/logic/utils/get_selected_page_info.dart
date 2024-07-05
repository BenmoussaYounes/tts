import 'package:flutter/widgets.dart';
import 'package:text_and_speech/features/app_wrapper/logic/utils/pages_info.dart';

import '../../../../core/enums/drawer_pages_enums.dart';

Record getSelectedPageInfo(DrawerPages page) {
  final ({
    String selectedPageAppBarTitle,
    Widget selectedPage,
    DrawerPages selectedPageIndex
  }) pageInfo;

  switch (page) {
    case DrawerPages.tts:
      pageInfo = ttsPageInfo;

    case DrawerPages.savedSpeeches:
      pageInfo = savedSpeechPageInfo;

    case DrawerPages.settings:
      pageInfo = settingsPageInfo;

    case DrawerPages.evaluation:
      pageInfo = evaluationPageInfo;

    case DrawerPages.about:
      pageInfo = aboutPageInfo;

    default:
      pageInfo = ttsPageInfo;
  }
  return pageInfo;
}
