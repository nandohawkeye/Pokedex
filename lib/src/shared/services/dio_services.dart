import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Dio)
class DioService extends DioForNative {
  DioService();
}
