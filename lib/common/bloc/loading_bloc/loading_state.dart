abstract class PopUpState {
  final bool? loading;
  final bool? showPopUp;

  PopUpState({this.loading, this.showPopUp});
}

class Loading extends PopUpState {
  Loading() : super(loading: true);
}

class Loaded extends PopUpState {
  Loaded() : super(loading: false);
}

class ShowPopUpState extends PopUpState {
  ShowPopUpState(bool? show) : super(showPopUp: show, loading: false);
}
