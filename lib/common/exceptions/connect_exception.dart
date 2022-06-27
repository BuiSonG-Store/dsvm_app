

import '../constants/string_constants.dart';
import 'app_exception.dart';

class ConnectException extends AppException {
  ConnectException({String? message})
      : super(
          message: message ?? StringConst.connectError,
        );
}


