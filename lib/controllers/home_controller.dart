import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:jacksi/constants/constants.dart';
import 'package:jacksi/models/category.dart';
import 'package:jacksi/models/product.dart';
import 'package:jacksi/utils/locale_db.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  //
  List<Product> _allLocaleProducts = [];
  List<Product> products = [];
  //
  // fetch-local-products
  fetchLocalProducts() async {
    isLoading = true;
    final productDataJson =
        LocalDB.instance.sp.getString(AppKeys.keys.productList);
    if (productDataJson == null) {
      _allLocaleProducts = [];
      return;
    } else {
      final productDataList = jsonDecode(productDataJson) as List<dynamic>;
      _allLocaleProducts = List<Product>.from(
        productDataList.map((e) => Product.fromJson(e)),
      ).toList();
      products = _allLocaleProducts;
    }
    log((_allLocaleProducts.first.category)!.toJson().toString());
    log('All-products ==> ${_allLocaleProducts.length}');

    isLoading = false;
    update();
  }

  // add-product
  addProduct(Product product) async {
    isLoading = true;
    _allLocaleProducts.insert(0, product);
    await updateLocalProductList();
    isLoading = false;
    update();
  }

  // remove-product
  removeProduct(Product product) async {
    isLoading = true;
    _allLocaleProducts.remove(product);
    await updateLocalProductList();
    isLoading = false;
    update();
  }

  // update-local-products
  updateLocalProductList() async {
    List<Map<String, dynamic>> list =
        _allLocaleProducts.map((e) => e.toJson()).toList();
    LocalDB.instance.sp.setString(AppKeys.keys.productList, jsonEncode(list));
  }

  // fillter-products
  filterProducts({bool showAll = true, CategoryModel? categoryModel}) async {
    log('${categoryModel?.nameAr}');
    isLoading = true;
    if (showAll) {
      products = _allLocaleProducts;
    } else {
      products = _allLocaleProducts
          .where((e) => e.category?.id == categoryModel!.id)
          .toList();
    }
    log('fillter-products ==> ${products.length}');
    isLoading = false;
    update();
  }

  //
  @override
  void onReady() {
    super.onReady();
    fetchLocalProducts();
  }
}
