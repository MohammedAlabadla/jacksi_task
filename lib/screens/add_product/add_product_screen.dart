import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jacksi/models/category.dart';
import 'package:jacksi/screens/add_product/components/product_images.dart';
import 'package:jacksi/screens/widgets/buttons.dart';
import 'package:jacksi/screens/widgets/dropdown_menu.dart';
import 'package:jacksi/screens/widgets/text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formState = GlobalKey<FormState>();
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
            const ProductImages(),
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
                      hintTxt: 'اسم المنتج',
                      height: 60.h,
                    ),
                    // store-name
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
                      child: Text(
                        'اسم المتجر',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomTextField(
                      hintTxt: 'اسم المتجر',
                      height: 60.h,
                    ),
                    // price
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
                      child: Text(
                        'السعر',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomTextField(
                      hintTxt: 'السعر',
                      height: 60.h,
                    ),
                    //
                    // category
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
                      child: Text(
                        'التصنيف',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    CustomDropDown(
                      items: CategoryModel.categories
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e.nameAr,
                              child: Text(
                                e.nameAr!,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff5973DE),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (p0) {},
                      // value: ,
                      hint: 'اسم التصنيف',
                      height: 60.h,
                    ),
                    //
                    SizedBox(height: 20.h),
                    CustomElevatedBtn(
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          //
                        }
                      },
                      width: double.infinity,
                      height: 60.h,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Text(
                        'اضافه المنتج',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
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
      title: const Text(
        'اضافة منتجات',
        style: TextStyle(color: Colors.black),
      ),
      toolbarHeight: 50.h,
      centerTitle: true,
      leading: Container(
        width: 50.w,
        height: 50.h,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.black26),
        ),
        child: IconButton(
          onPressed: () => Get.back(),
          splashRadius: 30,
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black54,
            size: 25.w,
          ),
        ),
      ),
    );
  }
}
