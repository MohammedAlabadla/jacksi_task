import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final String? value;
  final String? hint;
  final String? errorText;
  final List<DropdownMenuItem>? items;
  final Function(String)? onChanged;
  final double? width;
  final double height;
  final bool enableBorder;

  const CustomDropDown({
    super.key,
    this.value,
    this.hint = '',
    this.items,
    this.onChanged,
    this.errorText = '',
    this.width,
    this.height = 50,
    this.enableBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: height),
      // padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonFormField(
        value: value,
        items: items,
        isExpanded: true,
        onChanged: (dynamic item) => onChanged!(item.toString()),
        dropdownColor: Colors.grey.shade50,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
        hint: Text(
          hint!,
          style: TextStyle(
            color: const Color(0xff5973DE),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        validator: (dynamic value) {
          String msg = 'مطلوب';
          return (value == null) ? msg : null;
        },
        icon:
            const Icon(Icons.arrow_circle_down_sharp, color: Color(0xff5973DE)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: enableBorder
                ? BorderSide(color: Colors.black38, width: 0.5.w)
                : BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: enableBorder
                ? BorderSide(color: Colors.black38, width: 0.5.w)
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
            borderSide: enableBorder
                ? BorderSide(color: Colors.black38, width: 0.5.w)
                : BorderSide.none,
          ),
        ),
        //
      ),
    );
  }
}
//