import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:jacksi/screens/widgets/image_view.dart';

import '../../../constants/constants.dart';
import '../../../controllers/home_controller.dart';

class ListProductsOrder extends StatelessWidget {
  ListProductsOrder({super.key});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: homeController.products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 13.h),
      itemBuilder: (context, index) => Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => homeController.removeProduct(
                homeController.products[index],
              ),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(14.r),
              icon: Icons.delete,
              label: 'حذف',
            ),
          ],
        ),
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              // image
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: ImageView(
                  path: homeController.products[index].images!.first,
                  width: 115.w,
                  height: 115.h,
                ),
              ),
              SizedBox(width: 15.w),
              // texts
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      homeController.products[index].nameAR ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          (homeController.products[index].price ?? 00)
                              .toString(),
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: kPrimColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'دولار',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        homeController.products[index].storeNameAr ?? '',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffA1A1A1),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
