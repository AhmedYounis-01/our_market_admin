import 'package:flutter/material.dart';
import 'package:our_market_admin/core/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    this.child,
  });
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
        ),
        child: child,
      ),
    );
  }
}
