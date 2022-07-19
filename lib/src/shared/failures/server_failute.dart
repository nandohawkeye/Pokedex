import 'package:pokedex/src/shared/failures/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({super.mensage = 'Error server', super.stackTrace});
}
