import '../../../../core/enums/mos_enums.dart';
import '../../../../core/enums/tts_engines_enums.dart';

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
