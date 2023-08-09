class CategoryModel {
  String? id;
  String? nameAr;
  String? imagePath;
  CategoryModel({this.id, this.nameAr, this.imagePath});

  static List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      nameAr: 'تصنيف 1',
      imagePath: 'assets/images/cat1_img.png',
    ),
    CategoryModel(
      id: '2',
      nameAr: 'تصنيف 2',
      imagePath: 'assets/images/cat2_img.png',
    ),
    CategoryModel(
      id: '3',
      nameAr: 'تصنيف 3',
      imagePath: 'assets/images/cat3_img.png',
    ),
  ];
}
