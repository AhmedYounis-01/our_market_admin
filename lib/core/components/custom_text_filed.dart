import 'package:flutter/material.dart';
import 'package:our_market_admin/core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.controller,
    // callback to toggle visibility (only for password fields)
    this.onVisibilityToggle,
    // whether the text is currently obscured (password hidden)
    this.isObscured = false,
  });
  final String? labelText;
  final TextEditingController? controller;
  final void Function()? onVisibilityToggle;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 50,
        child: TextField(
          obscureText: isObscured,
          controller: controller,
          cursorColor: AppColors.kBlackColor,
          decoration: InputDecoration(
            suffixIcon: onVisibilityToggle != null
                ? IconButton(
                    onPressed: onVisibilityToggle,
                    icon: isObscured
                        ? const Icon(
                            Icons.visibility_off,
                            color: AppColors.kBlackColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: AppColors.kBlackColor,
                          ),
                  )
                : null,
            labelText: labelText,
            labelStyle: const TextStyle(color: AppColors.kBlackColor),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kBordersideColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kBordersideColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kBordersideColor,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
