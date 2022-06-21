

import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:dsvm_app/common/constants/string_constants.dart';

abstract class SnackbarEvent {}

class ShowSnackbarEvent extends SnackbarEvent {
  String content;
  SnackBarType type;
  Duration? duration;

  ShowSnackbarEvent({
    this.content = StringConst.someThingWentWrong,
    this.type = SnackBarType.error,
    this.duration,
  });
}
