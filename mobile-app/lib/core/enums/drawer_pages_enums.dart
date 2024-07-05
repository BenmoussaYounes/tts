enum DrawerPages {
  tts(0),
  savedSpeeches(1),
  evaluation(2),
  settings(3),
  about(4);

  const DrawerPages(this.pageIndex);

  final int pageIndex;

  static DrawerPages fromIndex(int index) {
    switch (index) {
      case 0:
        return DrawerPages.tts;
      case 1:
        return DrawerPages.savedSpeeches;
      case 2:
        return DrawerPages.evaluation;
      case 3:
        return DrawerPages.settings;
      case 4:
        return DrawerPages.about;
      default:
        return DrawerPages.tts;
    }
  }
}
