class Product {
  String? id;
  String? nameAR;
  String? storeNameAr;
  double? price;
  String? categoryAr;
  List<String>? images;

  Product({
    this.id,
    this.nameAR,
    this.storeNameAr,
    this.price,
    this.categoryAr,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        nameAR: json['nameAR'],
        storeNameAr: json['storeNameAr'],
        categoryAr: json['categoryAr'],
        price: json['price']?.toDouble(),
        images: List<String>.from(json['images'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameAR': nameAR,
        'storeNameAr': storeNameAr,
        'price': price,
        'categoryAr': categoryAr,
        'images': images,
      };
}
