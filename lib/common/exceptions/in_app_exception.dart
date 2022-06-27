

import '../constants/string_constants.dart';
import 'app_exception.dart';

class InAppException extends AppException {
  InAppException({
    String? message,
    int? errorCode,
    String? errorText,
  }) : super(
    message: message ?? StringConst.someThingWentWrong,
    errorCode: errorCode,
    errorText: errorText,
  );
}
