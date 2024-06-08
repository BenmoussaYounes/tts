import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/speech_to_text_cubit.dart';

class SpeechToText extends StatelessWidget {
  const SpeechToText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextCubit, SpeechToTextState>(
      builder: (context, state) {
        return Scaffold(
            body: Center(
              child: state.startListening
                  ? Text('Listening...')
                  : Text(
                      'Press the button and speak\n to convert speech to text',
                      style: TextStyle(fontSize: 18)),
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Start Listening',
              onPressed: () {
                if (state.startListening) {
                  context.read<SpeechToTextCubit>().stopListening();
                } else {
                  context.read<SpeechToTextCubit>().startListening();
                }
              },
              child: Icon(state.startListening ? Icons.stop : Icons.mic),
            ));
      },
    );
  }
}
