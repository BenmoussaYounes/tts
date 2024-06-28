import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/routing/app_router.dart';
import '../core/routing/routes.dart';
import '../core/theming/theme.dart';
import '../features/mos/logic/cubit/mos_cubit.dart';

class TextAndSpeechApp extends StatelessWidget {
  final AppRouter appRouter;
  const TextAndSpeechApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MosCubit())],
      child: MaterialApp(
        title: 'TextAndSpeech',
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
