import '../bloc/snackbar_bloc/snackbar_state.dart';
import '../constants/string_constants.dart';
import 'app_exception.dart';

class TokenExpiredException extends AppException {
  TokenExpiredException({int? errorCode, String? errorText})
      : super(
          type: SnackBarType.warning,
          message: StringConst.versionLoginInvalid,
          errorCode: errorCode,
          errorText: errorText,
        );
}
