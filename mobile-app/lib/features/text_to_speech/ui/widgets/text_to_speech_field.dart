import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/tts_engines.dart';
import '../../logic/cubit/text_to_speech_cubit.dart';

class TextToSpeechField extends StatefulWidget {
  const TextToSpeechField(
      this.textController, this.selectedTTSEngine, this.player,
      {super.key});
  final AudioPlayer player;
  final TextEditingController textController;
  final TTSEngine selectedTTSEngine;

  @override
  State<TextToSpeechField> createState() => _TextToSpeechFieldState();
}

class _TextToSpeechFieldState extends State<TextToSpeechField> {
  bool isConverting = false;
  bool isPlaying = false;
  String submittedText = '';

  @override
  Widget build(BuildContext context) {
    TextToSpeechCubit textToSpeechCubit =
        BlocProvider.of<TextToSpeechCubit>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextField(
            controller: widget.textController,
            maxLines: 5,
            maxLength: 50,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Enter your Text here',
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Divider(color: Theme.of(context).primaryColor.withOpacity(0.2)),
          textToSpeechCubit.state.convertToSpeech
              ? const CircularProgressIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete,
                            color: Theme.of(context).primaryColor)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share,
                            color: Theme.of(context).primaryColor)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.save,
                            color: Theme.of(context).primaryColor)),
                    IconButton(
                        onPressed: () async {
                          if (widget.textController.text.isNotEmpty) {
                            if (textToSpeechCubit.state.isPlaying) {
                              await textToSpeechCubit
                                  .stopPlaying(widget.player);
                            } else {
                              if (widget.textController.text == submittedText) {
                              } else {
                                // case new text is submitted
                                await textToSpeechCubit.convertTextToSpeech(
                                    widget.selectedTTSEngine,
                                    widget.textController.text,
                                    widget.player);
                              }
                            }
                          }
                        },
                        icon: Icon(
                            textToSpeechCubit.state.isPlaying
                                ? Icons.stop_circle
                                : Icons.play_circle,
                            color: Theme.of(context).primaryColor))
                  ],
                )
        ],
      ),
    );
  }
}
