part of 'speech_to_text_cubit.dart';

@immutable
sealed class SpeechToTextState {
  const SpeechToTextState({required this.startListening});

  final bool startListening;
}

final class SpeechToTextInitial extends SpeechToTextState {
  const SpeechToTextInitial() : super(startListening: false);
}

final class SpeechToTextListening extends SpeechToTextState {
  const SpeechToTextListening() : super(startListening: true);
}

final class SpeechToTextStopped extends SpeechToTextState {
  const SpeechToTextStopped() : super(startListening: false);
}
