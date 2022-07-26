import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/core/interfaces/i_response.dart';

class IResponseMock extends Mock implements IResponse {}

final responseMock = IResponseMock();
