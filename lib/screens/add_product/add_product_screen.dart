import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jacksi/models/category.dart';
import 'package:jacksi/models/product.dart';
import 'package:jacksi/screens/add_product/components/product_images.dart';
import 'package:jacksi/screens/widgets/buttons.dart';
import 'package:jacksi/screens/widgets/show_toast.dart';
import 'package:jacksi/screens/widgets/text_field.dart';

import '../../controllers/home_controller.dart';
import '../../utils/category_utils.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  //
  final homeController = Get.find<HomeController>();
  //
  final _formState = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final storeNameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final dropmenuCtrl = TextEditingController();
  CategoryModel? selectedCategory;
  List<String> images = [];

  // add-product
  addProduct() async {
    if (images.isEmpty) {
      ShowToast.show(msg: 'يجب اضافة صور للمنتج');
      return;
    }
    if (_formState.currentState!.validate()) {
      Product product = Product(
        id: '${DateTime.now()}',
        nameAR: nameCtrl.text,
        storeNameAr: storeNameCtrl.text,
        price: double.parse(priceCtrl.text),
        category: selectedCategory,
        images: images,
      );
      await homeController.addProduct(product);
      Get.back();
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
    storeNameCtrl.dispose();
    priceCtrl.dispose();
    dropmenuCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(16.r),
              child: Text(
                'صور المنتج',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ),
            // images
            ProductImages(
              onItemSelected: (list) {
                images = list;
                setState(() {});
              },
            ),
            //
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 40.h),
              child: Form(
                key: _formState,
                child: Column(
                  children: [
                    // product-name
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                      child: Text(
                        'اسم المنتج',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomTextField(
                      controller: nameCtrl,
                      hintTxt: 'اسم المنتج',
                      height: 60.h,
                    ),
                    // store-name
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
                      child: Text(
                        'اسم المتجر',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomTextField(
                      controller: storeNameCtrl,
                      hintTxt: 'اسم المتجر',
                      height: 60.h,
                    ),
                    // price
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
                      child: Text(
                        'السعر',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomTextField(
                      controller: priceCtrl,
                      hintTxt: 'السعر',
                      height: 60.h,
                    ),
                    //
                    // category
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: 20.h, bottom: 5.h),
                      child: Text(
                        'التصنيف',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomDropdown(
                      onChanged: (p0) {
                        selectedCategory = CategoryUtils.categories
                            .firstWhere((e) => e.nameAr == p0);
                        dropmenuCtrl.text = selectedCategory!.nameAr!;
                        setState(() {});
                      },
                      items: CategoryUtils.categories
                          .map((e) => e.nameAr!)
                          .toList(),
                      controller: dropmenuCtrl,
                      excludeSelected: true,
                      borderRadius: BorderRadius.circular(14.r),
                      errorText: 'مطلوب',
                      errorBorderSide:
                          const BorderSide(width: 1, color: Colors.red),
                      hintText: '  ' 'اختار تصنيف المنتج',
                      fieldSuffixIcon: Image.asset(
                        'assets/icons/arrowdown_ic.png',
                        scale: 2 / 1.2,
                      ),
                      selectedStyle: const TextStyle(
                        color: Color(0xff5973DE),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //
                    // btn
                    Container(
                      margin: EdgeInsets.only(top: 32.h, bottom: 20.h),
                      child: CustomElevatedBtn(
                        onPressed: () => addProduct(),
                        width: double.infinity,
                        child: Text(
                          'اضافه المنتج',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text('اضافة منتجات'),
      toolbarHeight: 50.h,
      centerTitle: true,
      leading: Container(
        width: 50.w,
        height: 50.h,
        margin: EdgeInsets.only(right: 15.w, top: 5.h),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.black12),
        ),
        child: IconButton(
          onPressed: () => Get.back(),
          splashRadius: 30,
          icon: Icon(Icons.arrow_back_ios_sharp,
              color: Colors.black87, size: 22.w),
        ),
      ),
    );
  }
}
