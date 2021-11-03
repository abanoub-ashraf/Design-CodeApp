import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: AppColors.kBackgroundColor,
                        borderRadius: BorderRadius.circular(42),
                    ),
                    child: const CircleAvatar(
                        backgroundImage: AssetImage(AppAssets.profileImage),
                        radius: 30,
                    ),
                ),
            ),
            height: 84,
            width: 84,
            decoration: BoxDecoration(
                gradient: const RadialGradient(
                    colors: [
                        Color(0xFF00AEFF),
                        Color(0xFF0076FF),
                    ],
                ),
                borderRadius: BorderRadius.circular(42),
            ),
        );
    }
}