import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:text_and_speech/features/app_wrapper/logic/cubit/app_wrapper_cubit.dart';

import 'package:text_and_speech/features/app_wrapper/ui/widgets/app_drawer_widget.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppWrapperCubit, AppWrapperState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.selectedPageAppBarTitle),
            centerTitle: true,
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          drawer: AppDrawer(
            onTap: (page) =>
                context.read<AppWrapperCubit>().selectPage(page, context),
            selectedPageIndex: state.selectedPageIndex,
          ),
          body: state.selectedPage,
        );
      },
    );
  }
}
