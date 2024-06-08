import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_assistant/core/enums/tts_engines.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_error_model.dart';

abstract class TextToSpeechRemoteDataSource {
  Future<Either<ApiErrorModel, Uint8List>> convertTextToSpeech(
      TTSEngine selectedTSSEngine, String text);
}

class TextToSpeechRemoteDataSourceImplementation
    implements TextToSpeechRemoteDataSource {
  @override
  Future<Either<ApiErrorModel, Uint8List>> convertTextToSpeech(
      TTSEngine selectedTSSEngine, String text) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        '${ApiConstants.apiBaseUrl}${ApiConstants.convert}',
        data: {
          'engine': selectedTSSEngine.value,
          'text': text,
        },
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        Uint8List wavBytes = response.data;
        return Right(wavBytes);
      } else {
        return Left(
            ApiErrorModel(message: response.data, code: response.statusCode!));
      }
    } catch (error) {
      return Left(ApiErrorModel(message: error.toString(), code: 500));
    }
  }

  // @override
  // Future<Either<ApiErrorModel, Unit>> submitEvaluation(
  //     EvaluationModel evaluationModel) async {
  //   final dio = Dio();
  //   try {
  //     final response = await dio.post(
  //       '${ApiConstants.apiBaseUrl}${ApiConstants.ttsEvaluate}',
  //       data: jsonEncode(evaluationModel.toJson()),
  //     );

  //     if (response.statusCode == 200) {
  //       return const Right(unit);
  //     } else {
  //       return Left(
  //           ApiErrorModel(message: response.data, code: response.statusCode!));
  //     }
  //   } catch (error) {
  //     return Left(ApiErrorModel(message: error.toString(), code: 500));
  //   }
  // }
}
