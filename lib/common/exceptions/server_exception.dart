

import '../constants/string_constants.dart';
import 'app_exception.dart';

class ServerException extends AppException {
  ServerException({
    String? message,
    int? errorCode,
    String? errorText,
  }) : super(
          message: message ?? StringConst.someThingWentWrong,
          errorCode: errorCode,
          errorText: errorText,
        );
}
