import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';

class IFailureMock extends Mock implements IFailure {}

final ifailureMock = IFailureMock();
