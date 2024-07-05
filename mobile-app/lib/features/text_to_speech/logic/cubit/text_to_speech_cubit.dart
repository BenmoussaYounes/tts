import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/tts_engines_enums.dart';
import '../../data/datasource/text_to_speech_remote_data_source.dart';

part 'text_to_speech_state.dart';

class TextToSpeechCubit extends Cubit<TextToSpeechState> {
  TextToSpeechCubit() : super(const TextToSpeechInitial());

  Future<void> convertTextToSpeech(
      TTSEngine selectedTSSEngine, String text, AudioPlayer player) async {
    emit(TextToSpeechConverting(submittedText: text));
    final result =
        await TextToSpeechRemoteDataSourceImplementation().convertTextToSpeech(
      selectedTSSEngine,
      text,
    );
    result.fold(
      (error) => emit(const TextToSpeechInitial()),
      (wavBuffer) async {
        emit(TextToSpeechPlaying(submittedText: state.submittedText));
        await player.setSourceBytes(wavBuffer);
        await player.setReleaseMode(ReleaseMode.stop);
        await player.resume();
      },
    );
  }

  Future<void> stopPlaying(AudioPlayer player) async {
    await player.stop();

    emit(const TextToSpeechInitial());
  }

  Future<void> playerFinished() async {
    emit(AudioFinished(submittedText: state.submittedText));
  }
}
