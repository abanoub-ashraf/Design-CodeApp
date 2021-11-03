import '../components/lists/course_sections_list.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'package:flutter/material.dart';

class CourseSectionsScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: const BoxDecoration(
                color: AppColors.kBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34)
                ),
            ),
            child: Column(
                children: [
                    Container(
                        padding: const EdgeInsets.all(32),
                        decoration: const BoxDecoration(
                            color: AppColors.kCardPopupBackgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(34),
                                bottomLeft: Radius.circular(34),
                            ),
                            boxShadow: [
                                BoxShadow(
                                    color: AppColors.kShadowColor,
                                    offset: Offset(0, 12),
                                ),
                            ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Text(
                                    'Course Sections', 
                                    style: kTitle2Style,
                                ),
                                const SizedBox(
                                    height: 5,
                                ),
                                Text(
                                    '12 sections', 
                                    style: kSubtitleStyle,
                                ),
                            ],
                        ),
                    ),
                    CourseSectionsList(),
                    const SizedBox(
                        height: 32,
                    ),
                ],
            ),
        );
    }
}