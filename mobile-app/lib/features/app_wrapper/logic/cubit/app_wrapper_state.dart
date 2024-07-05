part of 'app_wrapper_cubit.dart';

sealed class AppWrapperState extends Equatable {
  const AppWrapperState({
    required this.selectedPageAppBarTitle,
    required this.selectedPageIndex,
    required this.selectedPage,
  });

  final String selectedPageAppBarTitle;
  final DrawerPages selectedPageIndex;
  final Widget selectedPage;

  @override
  List<Object> get props =>
      [selectedPageIndex, selectedPage, selectedPageAppBarTitle];
}

final class AppWrapperInitial extends AppWrapperState {
  AppWrapperInitial()
      : super(
            selectedPageAppBarTitle: ttsPageInfo.selectedPageAppBarTitle,
            selectedPage: ttsPageInfo.selectedPage,
            selectedPageIndex: ttsPageInfo.selectedPageIndex);
}

final class SelectAnewPageState extends AppWrapperState {
  const SelectAnewPageState(String selectedPageAppBarTitle, Widget selectedPage,
      DrawerPages selectedPageIndex)
      : super(
          selectedPageAppBarTitle: selectedPageAppBarTitle,
          selectedPage: selectedPage,
          selectedPageIndex: selectedPageIndex,
        );
}
