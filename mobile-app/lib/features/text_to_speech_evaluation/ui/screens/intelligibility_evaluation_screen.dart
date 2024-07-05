import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_and_speech/core/widgets/app_text_form_field.dart';

import '../../../../core/enums/tts_engines_enums.dart';
import '../../../../core/helpers/path_strings/app_sounds.dart';
import '../../../../core/widgets/audio_player/player_widget.dart';
import '../../../../core/widgets/primary_button_widget.dart';
import '../../logic/cubit/mos_cubit.dart';

class IntelligibilityEvaluationScreen extends StatefulWidget {
  const IntelligibilityEvaluationScreen(this._selectedEngine, {super.key});
  final TTSEngine _selectedEngine;

  @override
  State<IntelligibilityEvaluationScreen> createState() =>
      _IntelligibilityEvaluationScreenState();
}

class _IntelligibilityEvaluationScreenState
    extends State<IntelligibilityEvaluationScreen> {
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
    await player.setSourceAsset(AppSounds.hmmBasedTTSSpeechSampleOne);
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
                  AppTextFormField(
                    controller: textController,
                    hintText:
                        'Write down the text you heard in the utterance above',
                    onChanged: (text) {
                      setState(() {
                        _isButtonDisabled = text.isEmpty;
                      });
                    },
                  )
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
