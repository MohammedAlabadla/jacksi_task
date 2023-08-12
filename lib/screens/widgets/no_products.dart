import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoProductsWidget extends StatelessWidget {
  const NoProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/animated/empty_gif.gif',
          scale: 5 / 1.7,
        ),
        Text(
          'لم يتم اضافة اي منتجات',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
