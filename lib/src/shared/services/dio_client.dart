// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/interfaces/i_client_http.dart';
import 'package:pokedex/src/core/interfaces/i_response.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/failures/server_failute.dart';
import 'package:pokedex/src/shared/models/custom_response.dart';

@Injectable(as: IClientHttp)
class DioClient extends IClientHttp {
  final Dio _dio;

  DioClient(this._dio);
  @override
  Future<Either<IFailure, IResponse>> get(String url) async {
    try {
      final result = await _dio.get(url);
      return right(CustomResponse(result.statusCode, result.data));
    } catch (error, st) {
      return left(
          ServerFailure(mensage: error.toString(), stackTrace: st.toString()));
    }
  }
}
