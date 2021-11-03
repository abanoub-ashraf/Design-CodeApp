import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class PlayIconWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(
                right: 28,
            ),
            child: Container(
                padding: const EdgeInsets.only(
                    top: 12.5,
                    bottom: 13.5,
                    left: 20.5,
                    right: 14.5,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                        BoxShadow(
                            color: AppColors.kShadowColor,
                            blurRadius: 16,
                            offset: Offset(0, 4),
                        ),
                    ],
                ),
                width: 60,
                height: 60,
                child: Image.asset(AppAssets.playIcon),
            ),
        );
    }
}