import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/shared/services/connectivity_service.dart';

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

void main() {
  late ConnectivityService service;
  setUp(() {
    service = ConnectivityServiceMock();
  });

  test('is Connected!', () async {
    when(() => service.getConnected()).thenAnswer((_) async => true);

    final result = await service.getConnected();

    expect(result, true);
  });
}
