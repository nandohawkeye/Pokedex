import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/core/interfaces/i_client_http.dart';

import '../../../mocks/i_failure_mock.dart';
import '../../../mocks/i_response_mock.dart';

class IClientHTTPMock extends Mock implements IClientHttp {}

void main() {
  late IClientHttp client;
  setUp(() {
    client = IClientHTTPMock();
  });

  test('Should be IResponse in IClientHTTPMock', () async {
    when(() => client.get('url')).thenAnswer((_) async => Right(responseMock));

    final result = await client.get('url');

    expect(result, Right(responseMock));
  });

  test('Should be IFailure in IClientHTTPMock', () async {
    when(() => client.get('url')).thenAnswer((_) async => Left(ifailureMock));

    final result = await client.get('url');

    expect(result, Left(ifailureMock));
  });
}
