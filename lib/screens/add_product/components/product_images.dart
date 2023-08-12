import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jacksi/utils/fetch_images_utility.dart';

import '../../../constants/constants.dart';
import '../../widgets/buttons.dart';
import '../../widgets/no_images.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key, required this.onItemSelected});

  final Function(List<String>) onItemSelected;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  List<XFile> images = [];

  getImagesBack() {
    widget.onItemSelected(images.map((e) => e.path).toList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // images-widgets
        images.isEmpty ? const NoImagesWidget() : buildImageList(),
        //
        // add-btn
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomElevatedBtn(
            onPressed: () async {
              images.addAll(await MediaUtility.instance.pickMultiImage());
              getImagesBack();
            },
            height: 60.h,
            borderRadius: BorderRadius.circular(10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: const Icon(Icons.add, color: kPrimColor, size: 18),
                ),
                Text(
                  'اضغط لاضافة الصور',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // images-list
  SizedBox buildImageList() {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        separatorBuilder: (context, index) => SizedBox(width: 3.w),
        itemBuilder: (context, index) => SizedBox(
          width: 100.w,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.file(
                    File(images[index].path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 7.w,
                top: 7.h,
                child: InkWell(
                  onTap: () {
                    images.removeAt(index);
                    getImagesBack();
                  },
                  child: Container(
                    width: 25.w,
                    padding: EdgeInsets.all(2.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffFF0000).withOpacity(.7),
                    ),
                    child:
                        const Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
