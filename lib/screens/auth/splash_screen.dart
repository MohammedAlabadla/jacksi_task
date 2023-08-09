import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jacksi/screens/products/products_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(
        const Duration(milliseconds: 850),
        () => Get.offAll(() => const ProductsScreen()),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/logo_img.jpeg'),
      ),
    );
  }
}
