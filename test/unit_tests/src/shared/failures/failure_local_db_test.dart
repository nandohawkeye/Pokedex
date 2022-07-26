import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/failures/failure_local_db.dart';

void main() {
  late FailureLocalDB failure;
  setUp(() {
    failure = FailureLocalDB(mensage: 'An error occurred on the local db');
  });

  test('Failure should be an extension of ifailure', () {
    expect(failure, isA<IFailure>());
  });

  test('failure message should be a string', () {
    expect(failure.mensage, isA<String>());
  });

  test('Mensage should be equals', () {
    expect(failure.mensage, 'An error occurred on the local db');
  });
}
