import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant/core/routing/app_router.dart';
import 'package:smart_assistant/core/routing/routes.dart';
import 'package:smart_assistant/core/theming/theme.dart';

import '../features/mos/logic/cubit/mos_cubit.dart';

class SmartVoiceAssistantApp extends StatelessWidget {
  final AppRouter appRouter;
  const SmartVoiceAssistantApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MosCubit())],
      child: MaterialApp(
        title: 'TTS',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.appWrapperScreen,
      ),
    );
  }
}
