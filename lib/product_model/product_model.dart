// ignore_for_file: file_names

class ProductDataModel {
  int? id;
  String? productName;
  String? productBrand;
  String? productImg;
  String? quantity;
  String? createdAt;
  String? updatedAt;

  ProductDataModel(
      { this.id,
        this.productName,
        this.productBrand,
        this.productImg,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productBrand = json['product_brand'];
    productImg = json['product_img'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_brand'] = this.productBrand;
    data['product_img'] = this.productImg;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
