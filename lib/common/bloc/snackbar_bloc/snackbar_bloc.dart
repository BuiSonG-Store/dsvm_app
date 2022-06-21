import 'dart:async';

import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_event.dart';
import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SnackBarBloc extends Bloc<SnackbarEvent, SnackBarState> {
  final duration = Duration(seconds: 4);

  factory SnackBarBloc() => _instance;

  SnackBarBloc._() : super(InitialSnackbarState());

  static final SnackBarBloc _instance = SnackBarBloc._();

  static SnackBarBloc get instance => _instance;
  bool _isShowing = false;

  /// Chỉ được show 1 lúc tối đa 2 cái
  int _quantity = 0;

  @override
  Stream<SnackBarState> mapEventToState(SnackbarEvent event) async* {
    if (event is ShowSnackbarEvent) {
      if (_quantity < 2) {
        _quantity++;
        yield ShowSnackBarState(
            mess: event.content,
            type: event.type,
            duration: event.duration ?? duration);
      }
      if (_quantity <= 1) {
        Timer(Duration(seconds: 4), () {
          _quantity = 0;
          // _isShowing = false;
        });
      }
    }
  }
}
