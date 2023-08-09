import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/constants.dart';

class ShowToast {
  static void show({
    required String msg,
    bool isSuccess = false,
    ToastGravity tg = ToastGravity.TOP,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: tg,
      timeInSecForIosWeb: !isSuccess ? 2 : 1,
      backgroundColor: isSuccess ? kPrimColor : Colors.red,
      textColor: Colors.white,
      fontSize: 17.sp,
    );
  }
}
