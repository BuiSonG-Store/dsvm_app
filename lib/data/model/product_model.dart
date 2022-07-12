class ProductModel {
  String? id;
  Product? product;
  String? image;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['\$id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['image'] = this.image;
    return data;
  }
}

class Product {
  int? id;
  String? $id;
  String? name;
  String? description;
  double? price;
  double? priceSale;
  String? dvt;
  int? amount;
  String? weight;
  String? createdDate;
  int? categoryId;
  int? regionId;
  int? provinceId;
  bool? checkHotProduct;
  dynamic category;
  dynamic region;
  dynamic province;
  String? $ref;


  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    $id = json['\$id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    priceSale = json['priceSale'];
    dvt = json['dvt'];
    amount = json['amount'];
    weight = json['weight'];
    createdDate = json['createdDate'];
    categoryId = json['categoryId'];
    regionId = json['regionId'];
    provinceId = json['provinceId'];
    checkHotProduct = json['checkHotProduct'];
    category = json['category'];
    region = json['region'];
    province = json['province'];
    $ref = json['\$ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['priceSale'] = this.priceSale;
    data['dvt'] = this.dvt;
    data['amount'] = this.amount;
    data['weight'] = this.weight;
    data['createdDate'] = this.createdDate;
    data['categoryId'] = this.categoryId;
    data['regionId'] = this.regionId;
    data['provinceId'] = this.provinceId;
    data['checkHotProduct'] = this.checkHotProduct;
    data['category'] = this.category;
    data['region'] = this.region;
    data['province'] = this.province;
    data['\$ref'] = this.$ref;
    return data;
  }
}