import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_assistant/core/enums/mos.dart';
import 'package:smart_assistant/core/enums/tts_engines.dart';
import 'package:smart_assistant/core/widgets/primary_button.dart';

import '../../../core/helpers/path_strings/app_sounds.dart';
import '../../../core/widgets/audio_player/player.dart';
import '../logic/cubit/mos_cubit.dart';

class StepTwo extends StatefulWidget {
  const StepTwo(this.stepOneEvaluationResult, {super.key});

  final (TTSEngine, String) stepOneEvaluationResult;

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  final AudioPlayer player = AudioPlayer();
  MOS? comprehensibilityRating;
  MOS? naturalnessRating;
  late bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = true;
    initAudioPlayer();
    super.initState();
  }

  initAudioPlayer() async {
    String sound;
    switch (widget.stepOneEvaluationResult.$1) {
      case TTSEngine.hmm:
        sound = AppSounds.hmmBasedTTSSpeechSampleTwo;
        break;
      case TTSEngine.tacotron2Melgan:
        sound = AppSounds.tacotron2MelganBasedTTSSpeechSampleTwo;
        break;
      case TTSEngine.tacotron2MbMelgan:
        sound = AppSounds.tacotron2MbMelganBasedTTSSpeechSampleTwo;
        break;
      case TTSEngine.fastspeech2Melgan:
        sound = AppSounds.fastspeech2MelganBasedTTSSpeechSampleTwo;
        break;
      case TTSEngine.fastspeech2MbMelgan:
        sound = AppSounds.fastspeech2MbMelganBasedTTSSpeechSampleTwo;
        break;
      default:
        sound = AppSounds.hmmBasedTTSSpeechSampleTwo;
    }
    await player.setSourceAsset(
      sound,
    );
    await player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void checkIfButtonCanBeEnable() {
    if (comprehensibilityRating != null && naturalnessRating != null) {
      setState(() {
        _isButtonDisabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to Speech Evaluation'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Speech',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 24),
                    PlayerWidget(
                      player: player,
                    ),
                    const SizedBox(height: 48),
                    Text(
                        '1. How would you rate the comprehensibility of the utterance you just heard? (1-5)',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(
                      height: 24,
                    ),
                    DropdownButton(
                        alignment: Alignment.topLeft,
                        items: const [
                          DropdownMenuItem(
                            value: MOS.bad,
                            child: Text('01 - Very poor'),
                          ),
                          DropdownMenuItem(
                            value: MOS.poor,
                            child: Text('02 - Poor'),
                          ),
                          DropdownMenuItem(
                            value: MOS.fair,
                            child: Text('03 - Average'),
                          ),
                          DropdownMenuItem(
                            value: MOS.good,
                            child: Text('04 - Good'),
                          ),
                          DropdownMenuItem(
                            value: MOS.excellent,
                            child: Text('05 - Excellent'),
                          ),
                        ],
                        value: comprehensibilityRating,
                        hint: const Text('Select comprehensibility rating'),
                        onChanged: (comprehensibilityRating) {
                          setState(() => this.comprehensibilityRating =
                              comprehensibilityRating);
                          checkIfButtonCanBeEnable();
                        }),
                    const SizedBox(height: 24),
                    Text(
                        '2. How would you rate the naturalness of the utterance you just heard? (1-5)',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(
                      height: 24,
                    ),
                    DropdownButton(
                        alignment: Alignment.topLeft,
                        items: const [
                          DropdownMenuItem(
                            value: MOS.bad,
                            child: Text('01 - Very poor'),
                          ),
                          DropdownMenuItem(
                            value: MOS.poor,
                            child: Text('02 - Poor'),
                          ),
                          DropdownMenuItem(
                            value: MOS.fair,
                            child: Text('03 - Average'),
                          ),
                          DropdownMenuItem(
                            value: MOS.good,
                            child: Text('04 - Good'),
                          ),
                          DropdownMenuItem(
                            value: MOS.excellent,
                            child: Text('05 - Excellent'),
                          ),
                        ],
                        value: naturalnessRating,
                        hint: const Text('Select naturalness rating'),
                        onChanged: (naturalnessRating) {
                          setState(
                              () => this.naturalnessRating = naturalnessRating);
                          checkIfButtonCanBeEnable();
                        }),
                  ],
                ),
              ],
            )),
      ),
      bottomNavigationBar: PrimaryButton(
        onPressed: _isButtonDisabled
            ? null
            : () {
                BlocProvider.of<MosCubit>(context).submitEvaluation(
                    context: context,
                    ttsEngine: widget.stepOneEvaluationResult.$1,
                    text: widget.stepOneEvaluationResult.$2,
                    comprehensibilityRating: comprehensibilityRating!,
                    naturalnessRating: naturalnessRating!);
              },
        text: 'Submit',
      ),
    );
  }
}
