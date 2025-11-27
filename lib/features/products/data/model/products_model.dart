class Products {
  String? productId;
  String? createdAt;
  String? productName;
  String? price;
  String? oldPrice;
  String? sale;
  String? description;
  String? category;
  String? imageUrl;

  Products({
    this.productId,
    this.createdAt,
    this.productName,
    this.price,
    this.oldPrice,
    this.sale,
    this.description,
    this.category,
    this.imageUrl,
  });

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    createdAt = json['created_at'];
    productName = json['product_name'];
    price = json['price'];
    oldPrice = json['old_price'];
    sale = json['sale'];
    description = json['description'];
    category = json['category'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['product_name'] = productName;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['sale'] = sale;
    data['description'] = description;
    data['category'] = category;
    data['image_url'] = imageUrl;
    return data;
  }
}
