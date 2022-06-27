
class ArgumentAllProductCommon {
  final String? title;
  final String? url;

  ArgumentAllProductCommon({
    this.title,
    this.url,
  });
}

class ArgumentPhotoViewerScreen {
  final List<ArgumentCatchDataImage>? images;
  final int? index;

  ArgumentPhotoViewerScreen({this.images, this.index});
}

class ArgumentCatchDataImage {
  // id random or id of url image of product
  // công dụng của id của urlImage để xác định những ảnh nào bị xóa đi
  int? id;

  // url or file
  dynamic data;

  ArgumentCatchDataImage({this.id, this.data});
}