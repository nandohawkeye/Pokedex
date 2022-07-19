abstract class IResponse {
  final int? statusCode;
  final Map<String, dynamic>? data;

  IResponse(this.statusCode, this.data);
}
