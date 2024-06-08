import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smart_assistant/core/widgets/snack_bars.dart';
import 'package:smart_assistant/features/mos/data/datasource/mos_remote_datasource.dart';
import 'package:smart_assistant/features/mos/data/models/evaluation_model.dart';

import '../../../../core/enums/mos.dart';
import '../../../../core/enums/tts_engines.dart';
import '../../../../core/routing/routes.dart';

part 'mos_state.dart';

class MosCubit extends Cubit<MosState> {
  MosCubit() : super(MosInitial());

  Future<void> navigateToStepOneScreen(
      BuildContext context, TTSEngine selectedEngine) async {
    await Navigator.pushNamed(context, Routes.mosStepOneScreen,
        arguments: selectedEngine);
  }

  Future<void> navigateToStepTwoScreen(
      BuildContext context, (TTSEngine, String) stepOneEvaluationResult) async {
    await Navigator.pushNamed(context, Routes.mosStepTwoScreen,
        arguments: stepOneEvaluationResult);
  }

  Future<void> submitEvaluation(
      {required BuildContext context,
      required TTSEngine ttsEngine,
      required String text,
      required MOS comprehensibilityRating,
      required MOS naturalnessRating}) async {
    final result = await MOSRemoteDataSourceImplementation().submitEvaluation(
        EvaluationModel(
            engine: ttsEngine,
            text: text,
            comprehensibility: comprehensibilityRating,
            naturalness: naturalnessRating));

    result.fold(
        (failure) =>
            showFailureSnackBar(context, 'Evaluation submission failed!'),
        (success) {
      showSuccessSnackBar(context, 'Evaluation submitted successfully!');
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.appWrapperScreen, (route) => false);
    });
  }
}
