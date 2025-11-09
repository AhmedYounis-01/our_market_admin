import 'package:flutter/material.dart';
import 'package:our_market_admin/core/utils/colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onPressed, this.searchController});
  final TextEditingController? searchController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(8),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            suffixIcon: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onPressed,
                child: const Icon(Icons.search),
              ),
            ),
            labelText: "Searh In Market",
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
