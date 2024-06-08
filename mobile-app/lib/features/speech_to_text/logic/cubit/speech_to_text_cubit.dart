import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'speech_to_text_state.dart';

class SpeechToTextCubit extends Cubit<SpeechToTextState> {
  SpeechToTextCubit() : super(const SpeechToTextInitial());

  void startListening() {
    emit(const SpeechToTextListening());
  }

  void stopListening() {
    emit(const SpeechToTextStopped());
  }
}
