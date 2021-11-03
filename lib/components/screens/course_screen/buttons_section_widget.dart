import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class ButtonsSectionWidget extends StatelessWidget {
    final PanelController panelController;

    const ButtonsSectionWidget({
        required this.panelController
    });

    Widget indicators() {
        final List<Widget> indicators = [];

        for (var i = 0; i < 9; i++) {
            indicators.add(
                Container(
                    width: 7,
                    height: 7,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == 0 ? AppColors.activeIndicator : AppColors.inActiveIndicator,
                    ),
                )
            );
        }

        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators,
        );
    }

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 24,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    indicators(),
                    GestureDetector(
                        onTap: () {
                            panelController.open();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                    BoxShadow(
                                        color: AppColors.kShadowColor,
                                        offset: Offset(0, 12),
                                        blurRadius: 16
                                    ),
                                ],
                                borderRadius: BorderRadius.circular(14),
                            ),
                            width: 80,
                            height: 40,
                            child: Text(
                                'View All',
                                style: kSearchTextStyle
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}