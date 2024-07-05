enum MOS {
  bad('bad'),
  poor('poor'),
  fair('fair'),
  good('good'),
  excellent('excellent');

  const MOS(this.value);
  final String value;

  static MOS fromString(String value) {
    switch (value) {
      case 'bad':
        return MOS.bad;
      case 'poor':
        return MOS.poor;
      case 'fair':
        return MOS.fair;
      case 'good':
        return MOS.good;
      case 'excellent':
        return MOS.excellent;
      default:
        return MOS.bad;
    }
  }
}
