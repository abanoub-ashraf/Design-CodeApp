import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Expanded(
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 12,
                    right: 20,
                ), 
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                            BoxShadow(
                                color: AppColors.kShadowColor,
                                offset: Offset(0, 12),
                                blurRadius: 16,
                            ),
                        ]
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                        ),
                        child: TextField(
                            cursorColor: AppColors.kPrimaryLabelColor,
                            decoration: InputDecoration(
                                icon: const Icon(
                                    Icons.search, 
                                    color: AppColors.kPrimaryLabelColor, 
                                    size: 20,
                                ),
                                border: InputBorder.none,
                                hintText: 'Search for Courses...',
                                hintStyle: kSearchPlaceholderStyle,
                            ),
                            style: kSearchTextStyle,
                            onChanged: (newText) {
                                print(newText);
                            },
                        ),
                    ),
                ),
            ),
        );
    }
}