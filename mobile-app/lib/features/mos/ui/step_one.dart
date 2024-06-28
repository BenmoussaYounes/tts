import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/tts_engines.dart';
import '../../../core/helpers/path_strings/app_sounds.dart';
import '../../../core/widgets/audio_player/player.dart';
import '../../../core/widgets/primary_button.dart';
import '../logic/cubit/mos_cubit.dart';

class StepOne extends StatefulWidget {
  const StepOne(this._selectedEngine, {super.key});
  final TTSEngine _selectedEngine;

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final AudioPlayer player = AudioPlayer();
  final TextEditingController textController = TextEditingController();
  late bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = true;
    initAudioPlayer();
    super.initState();
  }

  initAudioPlayer() async {
    String sound;
    switch (widget._selectedEngine) {
      case TTSEngine.hmm:
        sound = AppSounds.hmmBasedTTSSpeechSampleOne;
        break;
      case TTSEngine.tacotron2Melgan:
        sound = AppSounds.tacotron2MelganBasedTTSSpeechSampleOne;
        break;
      case TTSEngine.tacotron2MbMelgan:
        sound = AppSounds.tacotron2MbMelganBasedTTSSpeechSampleOne;
        break;
      case TTSEngine.fastspeech2Melgan:
        sound = AppSounds.fastspeech2MelganBasedTTSSpeechSampleOne;
        break;
      case TTSEngine.fastspeech2MbMelgan:
        sound = AppSounds.fastspeech2MbMelganBasedTTSSpeechSampleOne;
        break;
      default:
        sound = AppSounds.hmmBasedTTSSpeechSampleOne;
    }
    await player.setSourceAsset(sound);
    await player.setReleaseMode(ReleaseMode.stop);
  }

  @override
  void dispose() {
    player.dispose();
    textController.dispose();
    super.dispose();
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
                  Text('Speech', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 24),
                  PlayerWidget(
                    player: player,
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 24),
                  TextField(
                    controller: textController,
                    maxLines: 3,
                    maxLength: 100,
                    onChanged: (text) {
                      setState(() {
                        _isButtonDisabled = text.isEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText:
                          'Write down the text you heard in the utterance above',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        onPressed: _isButtonDisabled
            ? null
            : () => BlocProvider.of<MosCubit>(context)
                    .navigateToStepTwoScreen(context, (
                  widget._selectedEngine,
                  textController.text,
                )),
        text: 'Continue',
      ),
    );
  }
}
