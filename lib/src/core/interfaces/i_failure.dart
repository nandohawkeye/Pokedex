abstract class IFailure {
  final String mensage;
  final String? stackTrace;

  IFailure({required this.mensage, this.stackTrace});
}
