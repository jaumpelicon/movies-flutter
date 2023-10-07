import 'package:dio/dio.dart';

import '../../localization/localize.dart';

class ServerError {
  final String? _error;
  final List<String>? _errors;

  ServerError({String? error, List<String>? errors})
      : _error = error,
        _errors = errors;

  ServerError.fromMap(Map<String, dynamic> map)
      : _error = map['error'],
        _errors = List<String>.from(map['errors']?.map((error) => error as String) ?? []);

  String get description {
    return _error ?? _errors?.join(', ') ?? Localize.instance.l10n.requestError;
  }
}

extension DioErrorExtension on DioException {
  ServerError asServerError() {
    try {
      final serverError = ServerError.fromMap(response?.data);
      return serverError;
    } on TypeError catch (error) {
      return error.internalError();
    } on Error {
      return _mapToServerError();
    }
  }

  ServerError _mapToServerError() {
    final error = this;

    if (error.type == DioExceptionType.connectionError) {
      return ServerError(error: Localize.instance.l10n.timeoutError);
    }

    return ServerError(error: Localize.instance.l10n.requestError);
  }
}

extension ErrorExtension on Error {
  ServerError internalError() {
    if (this is TypeError) return ServerError(error: Localize.instance.l10n.mappingFailureError);

    return ServerError(error: Localize.instance.l10n.requestError);
  }
}
