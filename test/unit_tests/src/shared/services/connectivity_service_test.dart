// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/shared/services/connectivity_service.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

const bool connected = true;
const bool dontConnected = false;
Stream<bool> streamConnected = Stream<bool>.fromIterable([connected]);
Stream<bool> streamDontConnected = Stream<bool>.fromIterable([dontConnected]);

void main() {
  late ConnectivityService service;
  MockConnectivityPlatform fakePlatform;
  setUp(() {
    fakePlatform = MockConnectivityPlatform();
    ConnectivityPlatform.instance = fakePlatform;
    service = ConnectivityServiceMock();
  });

  test('is Connected!', () async {
    when(() => service.getConnected()).thenAnswer((_) async => connected);

    final result = await service.getConnected();

    expect(result, connected);
  });

  test('don\'t Connected!', () async {
    when(() => service.getConnected()).thenAnswer((_) async => dontConnected);

    final result = await service.getConnected();

    expect(result, dontConnected);
  });

  test('Stream is connected', () {
    when(service.isConnectedStream).thenAnswer((_) => streamConnected);

    final stream = service.isConnectedStream();

    expect(stream, streamConnected);
  });

  test('Stream is don\' connected', () {
    when(service.isConnectedStream).thenAnswer((_) => streamDontConnected);

    final stream = service.isConnectedStream();

    expect(stream, streamDontConnected);
  });
}

class MockConnectivityPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {}
