import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class SidebarButtonWidget extends StatelessWidget {
    final VoidCallback triggerAnimation;

    const SidebarButtonWidget({
        required this.triggerAnimation
    });

    @override
    Widget build(BuildContext context) {
        return RawMaterialButton(
            ///
            /// shrinkWrap means when we tap on the button we tap only on its content
            /// and not everything outside of it
            ///
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            constraints: const BoxConstraints(
                maxWidth: 40,
                maxHeight: 40,
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
                    ],
                ),
                child: Image.asset(
                    AppAssets.sidebarIcon,
                    color: AppColors.kPrimaryLabelColor,
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14
                ),
            ),
            onPressed: triggerAnimation,
        );
    }
}