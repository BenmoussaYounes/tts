import 'package:flutter/material.dart';
import 'package:text_and_speech/core/routing/routes.dart';

import '../../features/app_wrapper/ui/app_wrapper_screen.dart';

import '../../features/text_to_speech_evaluation/ui/screens/intelligibility_evaluation_screen.dart';
import '../../features/text_to_speech_evaluation/ui/screens/comprehensibility_and_naturalness_evaluation_screen.dart';
import '../enums/tts_engines_enums.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AppWrapper());
      case Routes.intelligibilityEvaluationScreen:
        return MaterialPageRoute(
            builder: (_) => IntelligibilityEvaluationScreen(
                settings.arguments as TTSEngine));
      case Routes.comprehensibilityNaturalnessEvaluationScreen:
        return MaterialPageRoute(
            builder: (_) => ComprehensibilityAndNaturalnessEvaluationScreen(
                settings.arguments as (TTSEngine, String)));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
