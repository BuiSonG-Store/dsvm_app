class AppHeader {
  String? accessToken;
  double? lat;
  double? lng;

  AppHeader({this.accessToken, this.lat, this.lng});

  AppHeader.fromJson(Map<String, dynamic> json) {
    accessToken = json['Authorization'];
  }
}
