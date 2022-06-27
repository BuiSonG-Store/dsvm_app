import '../bloc/snackbar_bloc/snackbar_state.dart';
import '../constants/string_constants.dart';

class AppException implements Exception {

  /// message return from server
  String message;

  final int? errorCode;

  /// message internal want to log to server
  String? errorText;


  /// Snackbar Type
  SnackBarType? type;

  AppException(
      {this.message = StringConst.someThingWentWrong,
      this.errorCode,
      this.type,
      this.errorText});
}

