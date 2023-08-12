import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoImagesWidget extends StatelessWidget {
  const NoImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        separatorBuilder: (context, index) => SizedBox(width: 3.w),
        itemBuilder: (context, index) => Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(7.r),
          ),
        ),
      ),
    );
  }
}
