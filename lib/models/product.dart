import 'package:jacksi/models/category.dart';

class Product {
  String? id;
  String? nameAR;
  String? storeNameAr;
  double? price;
  CategoryModel? category;
  List<String>? images;

  Product({
    this.id,
    this.nameAR,
    this.storeNameAr,
    this.price,
    this.category,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        nameAR: json['nameAR'],
        storeNameAr: json['storeNameAr'],
        category: CategoryModel.fromJson(json['category']),
        price: json['price']?.toDouble(),
        images: List<String>.from(json['images'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameAR': nameAR,
        'storeNameAr': storeNameAr,
        'price': price,
        'category': category,
        'images': images,
      };
}
