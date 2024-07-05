import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_and_speech/core/enums/drawer_pages_enums.dart';
import 'package:text_and_speech/features/app_wrapper/logic/utils/pages_info.dart';

import '../utils/get_selected_page_info.dart';

part 'app_wrapper_state.dart';

class AppWrapperCubit extends Cubit<AppWrapperState> {
  AppWrapperCubit() : super(AppWrapperInitial());

  void selectPage(DrawerPages page, BuildContext context) {
    final ({
      String selectedPageAppBarTitle,
      Widget selectedPage,
      DrawerPages selectedPageIndex
    }) pageInfo = getSelectedPageInfo(page) as ({
      String selectedPageAppBarTitle,
      Widget selectedPage,
      DrawerPages selectedPageIndex
    });

    emit(SelectAnewPageState(
      pageInfo.selectedPageAppBarTitle,
      pageInfo.selectedPage,
      pageInfo.selectedPageIndex,
    ));

    Navigator.of(context).pop();
    // emit(SelectAnewPageState(page));
  }
}
