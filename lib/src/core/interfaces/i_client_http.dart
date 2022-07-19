// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/core/interfaces/i_response.dart';

abstract class IClientHttp {
  Future<Either<IFailure, IResponse>> get(String url);
}
