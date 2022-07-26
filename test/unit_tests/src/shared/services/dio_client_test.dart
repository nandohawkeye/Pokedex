import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/core/interfaces/i_client_http.dart';
import 'package:pokedex/src/shared/services/dio_client.dart';

import '../../../../mocks/custom_response_mock.dart';
import '../../../../mocks/server_failure_mock.dart';

class DioClientMock extends Mock implements DioClient {}

void main() {
  late DioClient dio;
  setUp(() {
    dio = DioClientMock();
  });

  test('Should be a extension of IClientHttp', () {
    expect(dio, isA<IClientHttp>());
  });

  test('Should be a CustomResponse', () async {
    when(() => dio.get('url'))
        .thenAnswer((_) async => Right(customResponseMock));

    final result = await dio.get('url');

    expect(result, right(customResponseMock));
  });

  test('Should be a ServerFailure', () async {
    when(() => dio.get('url')).thenAnswer((_) async => Left(serverFailureMock));

    final result = await dio.get('url');

    expect(result, left(serverFailureMock));
  });
}
