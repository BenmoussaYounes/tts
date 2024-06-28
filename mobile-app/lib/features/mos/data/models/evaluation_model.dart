import '../../../../core/enums/mos.dart';
import '../../../../core/enums/tts_engines.dart';

class EvaluationModel {
  final TTSEngine engine;
  final String text;
  final MOS comprehensibility;
  final MOS naturalness;

  EvaluationModel({
    required this.engine,
    required this.text,
    required this.comprehensibility,
    required this.naturalness,
  });

  toJson() {
    return {
      'engine': engine.value,
      'text': text,
      'comprehensibility': comprehensibility.value,
      'naturalness': naturalness.value,
    };
  }
}
