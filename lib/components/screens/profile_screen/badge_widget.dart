import '../../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
    final List<String> badges;
    final int index;

    const BadgeWidget({
        required this.badges,
        required this.index
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.only(
                left: 20,
                right: index != 3 ? 0 : 20,
            ),
            decoration: BoxDecoration(
                boxShadow: [
                    BoxShadow(
                        color: AppColors.kShadowColor.withOpacity(0.1),
                        offset: const Offset(0, 12),
                        blurRadius: 18
                    ),
                ],
            ),
            child: Image.asset(
                'assets/badges/${badges[index]}',
            ),
        );
    }
}