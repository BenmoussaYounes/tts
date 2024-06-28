import 'package:flutter/material.dart';

import '../../features/app_wrapper.dart';
import '../../features/mos/ui/mos_screen.dart';
import '../../features/mos/ui/step_one.dart';
import '../../features/mos/ui/step_two.dart';
import '../enums/tts_engines.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AppWrapper());
      case 'mos':
        return MaterialPageRoute(builder: (_) => const MOSScreen());
      case 'mos/step_one':
        return MaterialPageRoute(
            builder: (_) => StepOne(settings.arguments as TTSEngine));
      case 'mos/step_two':
        return MaterialPageRoute(
            builder: (_) => StepTwo(settings.arguments as (TTSEngine, String)));

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
