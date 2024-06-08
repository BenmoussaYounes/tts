part of 'text_to_speech_cubit.dart';

class TextToSpeechState {
  final bool convertToSpeech;
  final bool isPlaying;
  final String submittedText;
  final Uint8List? wavBuffer;

  const TextToSpeechState(
      {required this.convertToSpeech,
      required this.isPlaying,
      required this.submittedText,
      this.wavBuffer});

  copyWith({
    bool? convertToSpeech,
    bool? isPlaying,
    String? submittedText,
  }) {
    return TextToSpeechState(
      convertToSpeech: convertToSpeech ?? this.convertToSpeech,
      isPlaying: isPlaying ?? this.isPlaying,
      submittedText: submittedText ?? this.submittedText,
    );
  }
}

final class TextToSpeechInitial extends TextToSpeechState {
  const TextToSpeechInitial()
      : super(convertToSpeech: false, isPlaying: false, submittedText: '');
}

final class TextToSpeechConverting extends TextToSpeechState {
  const TextToSpeechConverting({required super.submittedText})
      : super(convertToSpeech: true, isPlaying: false);
}

final class TextToSpeechConverted extends TextToSpeechState {
  const TextToSpeechConverted({required super.submittedText})
      : super(convertToSpeech: false, isPlaying: true);
}

final class TextToSpeechPlaying extends TextToSpeechState {
  const TextToSpeechPlaying({required super.submittedText})
      : super(convertToSpeech: false, isPlaying: true);
}

final class TextToSpeechPlayed extends TextToSpeechState {
  const TextToSpeechPlayed({required super.submittedText})
      : super(convertToSpeech: false, isPlaying: false);
}

final class AudioFinished extends TextToSpeechState {
  const AudioFinished({required super.submittedText})
      : super(convertToSpeech: false, isPlaying: false);
}
