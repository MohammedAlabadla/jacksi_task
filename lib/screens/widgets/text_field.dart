import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintTxt,
    this.maxLines,
    this.minLines,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.isValidate = true,
    this.isScureField = false,
    this.isDigits = false,
    this.isEnabled = true,
    this.height = 50,
    this.width,
    this.prefixIcon,
    this.enableBorder = true,
  });

  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isValidate;
  final bool? isScureField;
  final bool isEnabled;
  final String? hintTxt;
  final bool isDigits;
  final double? height;
  final double? width;
  final Widget? prefixIcon;
  final bool enableBorder;
  // final b

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width?.w,
      // height: widget.height?.h,
      constraints: BoxConstraints(minHeight: widget.height ?? 0),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: kPrimColor,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        obscureText: widget.isScureField! ? !_showPassword : false,
        obscuringCharacter: '*',
        validator: (value) {
          String? msg;
          if (value == null || value.isEmpty) {
            msg = 'مطلوب';
          }
          return (widget.isValidate!) ? msg : null;
        },
        decoration: InputDecoration(
          enabled: widget.isEnabled,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: widget.enableBorder
                ? const BorderSide(color: Colors.black12)
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: widget.enableBorder
                ? const BorderSide(color: kPrimColor)
                : BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: widget.enableBorder
                ? const BorderSide(color: Colors.black12)
                : BorderSide.none,
          ),
          hintText: widget.hintTxt,
          hintStyle: TextStyle(color: Colors.black38, fontSize: 12.sp),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isScureField!
              ? IconButton(
                  onPressed: () =>
                      setState(() => _showPassword = !_showPassword),
                  icon: _showPassword
                      ? const Icon(Icons.visibility, color: kPrimColor)
                      : const Icon(Icons.visibility_off, color: Colors.grey),
                )
              : null,
        ),
        inputFormatters:
            (widget.isDigits) ? [FilteringTextInputFormatter.digitsOnly] : null,
      ),
    );
  }
}

class NewsTextField extends StatelessWidget {
  const NewsTextField({
    super.key,
    this.controller,
    this.hintTxt,
    this.maxLines,
    this.minLines,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.isValidate = false,
    this.isScureField = false,
    this.isDigits = false,
    this.isEnabled = true,
    this.height = 50,
    this.width,
    this.suffixIcon,
  });

  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isValidate;
  final bool? isScureField;
  final bool isEnabled;
  final String? hintTxt;
  final bool isDigits;
  final double? height;
  final double? width;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height?.h ?? 0.0,
        minWidth: width?.w ?? 0.0,
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: kPrimColor,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: inputType,
        textInputAction: inputAction,
        decoration: InputDecoration(
          enabled: isEnabled,
          filled: true,
          focusColor: const Color(0xFFF9F9FB),
          contentPadding: EdgeInsets.only(left: 5.w, right: 5.w),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.r),
          ),
          hintText: hintTxt,
          hintStyle: TextStyle(color: Colors.black38, fontSize: 12.sp),
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: kPrimColor,
          suffixIcon: suffixIcon,
        ),
        inputFormatters:
            (isDigits) ? [FilteringTextInputFormatter.digitsOnly] : null,
      ),
    );
  }
}
