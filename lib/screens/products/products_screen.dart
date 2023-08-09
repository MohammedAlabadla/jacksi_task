import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jacksi/constants/constants.dart';
import 'package:jacksi/models/category.dart';
import 'package:jacksi/screens/add_product/add_product_screen.dart';
import 'package:jacksi/screens/widgets/buttons.dart';

import 'components/grid_products_order.dart';
import 'components/list_products_order.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int selectedCatId = 0;
  bool isGridOrder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(bottom: 10.h, right: 16.w, left: 16.w),
              child: Text(
                'التصنيفات',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ),
            buildCategoriesList(),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  changeProductsViewOrdersBtn(),
                  SizedBox(height: 15.h),
                  //
                  isGridOrder
                      ? const GridProductsOrder()
                      : const ListProductsOrder(),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align changeProductsViewOrdersBtn() {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomElevatedBtn(
        onPressed: () => setState(() => isGridOrder = !isGridOrder),
        height: 45.h,
        borderRadius: BorderRadius.circular(10.r),
        bgColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/view_ic.png', width: 20.w),
              SizedBox(width: 10.w),
              Text(
                'تغيير عرض المنتجات الى افقي',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildCategoriesList() {
    return SizedBox(
      height: 115.h,
      width: double.infinity,
      child: ListView.separated(
        itemCount: CategoryModel.categories.length + 1,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          // show-all-products
          if (index == 0) {
            return InkWell(
              onTap: () => setState(() => selectedCatId = index),
              child: Container(
                width: 95.w,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: selectedCatId == index
                      ? Border.all(color: kPrimColor, width: 1.5)
                      : null,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 66.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kPrimColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Image.asset(
                        'assets/icons/category_ic.png',
                        scale: 5 / 1.5,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Flexible(
                      child: Center(
                        child: Text(
                          'عرض الكل',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return InkWell(
            onTap: () => setState(() => selectedCatId = index),
            child: Container(
              width: 95.w,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: selectedCatId == index
                    ? Border.all(color: kPrimColor, width: 1.5)
                    : null,
              ),
              child: Column(
                children: [
                  Container(
                    height: 66.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        CategoryModel.categories[index - 1].imagePath!,
                        scale: 5 / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: Text(
                        CategoryModel.categories[index - 1].nameAr!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text(
        'المنتجات',
        style: TextStyle(color: Colors.black),
      ),
      toolbarHeight: 50.h,
      actions: [
        Container(
          width: 50.w,
          height: 50.h,
          margin: EdgeInsets.only(left: 30.w),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: Colors.black26),
          ),
          child: IconButton(
            onPressed: () => Get.to(() => const AddProductScreen()),
            icon: Icon(Icons.add, color: Colors.black, size: 30.w),
            splashRadius: 30,
          ),
        ),
      ],
    );
  }
}
