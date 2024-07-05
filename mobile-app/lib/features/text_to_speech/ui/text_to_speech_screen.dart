import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/tts_engines_enums.dart';
import '../logic/cubit/text_to_speech_cubit.dart';
import 'widgets/text_to_speech_field.dart';

class TextToSpeechScreen extends StatefulWidget {
  const TextToSpeechScreen({super.key});

  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  late TTSEngine selectedTTSEngine;
  late TextEditingController textController;
  late AudioPlayer player;
  @override
  void initState() {
    selectedTTSEngine = TTSEngine.hmm;
    textController = TextEditingController();
    player = AudioPlayer();

    player.onPlayerComplete.listen((event) {
      BlocProvider.of<TextToSpeechCubit>(context).playerFinished();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TextToSpeechCubit(),
        child: BlocBuilder<TextToSpeechCubit, TextToSpeechState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                        'Take any written text and magically turn it into smooth, natural-sounding speech.',
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Text('Language: '),
                        const SizedBox(width: 12),
                        DropdownButton(
                            alignment: Alignment.topLeft,
                            items: const [],
                            value: null,
                            hint: const Text('English'),
                            onChanged: (_) {}),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('TTS Engine: '),
                        const SizedBox(width: 12),
                        DropdownButton(
                            alignment: Alignment.topLeft,
                            items: const [
                              DropdownMenuItem(
                                value: TTSEngine.hmm,
                                child: Text('HMM'),
                              ),
                              // DropdownMenuItem(
                              //   value: TTSEngine.tacotron2Melgan,
                              //   child: Text('Tacotron2-MelGAN'),
                              // ),
                              // DropdownMenuItem(
                              //   value: TTSEngine.tacotron2MbMelgan,
                              //   child: Text('Tacotron2-MB-MelGAN'),
                              // ),
                              // DropdownMenuItem(
                              //   value: TTSEngine.fastspeech2Melgan,
                              //   child: Text('FastSpeech2-MelGAN'),
                              // ),
                              // DropdownMenuItem(
                              //   value: TTSEngine.fastspeech2MbMelgan,
                              //   child: Text('FastSpeech2-MB-MelGAN'),
                              // ),
                              // DropdownMenuItem(
                              //   value: TTSEngine.tacotron,
                              //   child: Text('Tacotron 2'),
                              // ),
                              // DropdownMenuItem(
                              //   value: TTSEngine.fastspeech,
                              //   child: Text('FastSpeech 2'),
                              // ),
                            ],
                            value: selectedTTSEngine,
                            onChanged: (tssEngine) =>
                                setState(() => selectedTTSEngine = tssEngine!)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    TextToSpeechField(
                        textController, selectedTTSEngine, player),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
