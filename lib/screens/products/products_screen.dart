import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jacksi/constants/constants.dart';
import 'package:jacksi/screens/add_product/add_product_screen.dart';
import 'package:jacksi/screens/widgets/buttons.dart';
import 'package:jacksi/screens/widgets/no_products.dart';

import '../../controllers/home_controller.dart';
import '../../utils/category_utils.dart';
import 'components/grid_products_order.dart';
import 'components/list_products_order.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  //
  final homeController = Get.find<HomeController>();

  //
  int selectedCatId = 0;
  bool isGridOrder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: GetBuilder(
        init: homeController,
        builder: (_) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(bottom: 10.h, right: 16.w, left: 16.w),
                child: Text(
                  'التصنيفات',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
              ),
              buildCategoriesList(),
              // items
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (homeController.products.isNotEmpty)
                      changeProductsViewOrdersBtn(),
                    SizedBox(height: 15.h),
                    homeController.products.isEmpty
                        ? const NoProductsWidget()
                        : isGridOrder
                            ? GridProductsOrder()
                            : ListProductsOrder(),
                    //
                  ],
                ),
              ),
            ],
          ),
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
                isGridOrder
                    ? 'تغيير عرض المنتجات الى عمودي'
                    : 'تغيير عرض المنتجات الى افقي',
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
        itemCount: CategoryUtils.categories.length + 1,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          // show-all-products
          if (index == 0) {
            return InkWell(
              onTap: () {
                selectedCatId = index;
                homeController.filterProducts(showAll: true);
                // setState(() => );
              },
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
            onTap: () {
              selectedCatId = index;
              homeController.filterProducts(
                showAll: false,
                categoryModel: CategoryUtils.categories[selectedCatId - 1],
              );
              // setState(() => );
            },
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
                        CategoryUtils.categories[index - 1].imagePath!,
                        scale: 5 / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: Text(
                        CategoryUtils.categories[index - 1].nameAr!,
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
      title: const Text('المنتجات'),
      toolbarHeight: 50.h,
      actions: [
        Container(
          width: 45.w,
          margin: EdgeInsets.only(left: 25.w, top: 5.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: Colors.black12),
          ),
          child: InkWell(
            onTap: () => Get.to(() => const AddProductScreen()),
            child: Icon(Icons.add, color: Colors.black, size: 30.w),
          ),
        ),
      ],
    );
  }
}
