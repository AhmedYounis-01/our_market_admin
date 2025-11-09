 import 'package:flutter/material.dart';
import 'package:our_market_admin/core/utils/colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: const CircularProgressIndicator(
          backgroundColor: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
