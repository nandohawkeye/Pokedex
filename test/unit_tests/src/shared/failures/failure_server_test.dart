import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/failures/server_failute.dart';

void main() {
  late ServerFailure failure;
  setUp(() {
    failure = ServerFailure(mensage: 'An error occurred on the server');
  });

  test('Failure should be an extension of ifailure', () {
    expect(failure, isA<IFailure>());
  });

  test('failure message should be a string', () {
    expect(failure.mensage, isA<String>());
  });

  test('Mensage should be equals', () {
    expect(failure.mensage, 'An error occurred on the server');
  });
}
