import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_error_model.dart';
import '../models/evaluation_model.dart';

abstract class MOSRemoteDataSource {
  Future<Either<ApiErrorModel, Unit>> submitEvaluation(
      EvaluationModel evaluationModel);
}

class MOSRemoteDataSourceImplementation implements MOSRemoteDataSource {
  @override
  Future<Either<ApiErrorModel, Unit>> submitEvaluation(
      EvaluationModel evaluationModel) async {
    final dio = Dio();
    try {
      final response = await dio.post(
        '${ApiConstants.apiBaseUrl}${ApiConstants.evaluate}',
        data: jsonEncode(evaluationModel.toJson()),
      );

      if (response.statusCode == 200) {
        return const Right(unit);
      } else {
        return Left(
            ApiErrorModel(message: response.data, code: response.statusCode!));
      }
    } catch (error) {
      return Left(ApiErrorModel(message: error.toString(), code: 500));
    }
  }
}
