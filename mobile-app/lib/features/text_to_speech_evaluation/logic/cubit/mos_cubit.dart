import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/mos_enums.dart';
import '../../../../core/enums/tts_engines_enums.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/snack_bars_widget.dart';
import '../../data/datasource/mos_remote_datasource.dart';
import '../../data/models/evaluation_model.dart';

part 'mos_state.dart';

class MosCubit extends Cubit<MosState> {
  MosCubit() : super(MosInitial());

  Future<void> navigateToStepOneScreen(
      BuildContext context, TTSEngine selectedEngine) async {
    await Navigator.pushNamed(context, Routes.intelligibilityEvaluationScreen,
        arguments: selectedEngine);
  }

  Future<void> navigateToStepTwoScreen(
      BuildContext context, (TTSEngine, String) stepOneEvaluationResult) async {
    await Navigator.pushNamed(
        context, Routes.comprehensibilityNaturalnessEvaluationScreen,
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
