class CategoryModel {
  String? id;
  String? nameAr;
  String? imagePath;
  CategoryModel({this.id, this.nameAr, this.imagePath});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        nameAr: json['nameAr'],
        imagePath: json['imagePath'],
      );

  Map<String, dynamic> toJson() {
    return {'id': id, 'nameAr': nameAr, 'imagePath': imagePath};
  }
}
