import '../../lists/completed_courses_list.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import 'package:flutter/material.dart';

class CompletedCoursesSection extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 12,
                    ),
                    child: Column(
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        'Completed Courses',
                                        style: kHeadlineLabelStyle,
                                    ),
                                    Row(
                                        children: [
                                            Text(
                                                'See All',
                                                style: kSearchPlaceholderStyle,
                                            ),
                                            const Icon(
                                                Icons.chevron_right,
                                                color: AppColors.kSecondaryLabelColor,
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ],
                    ),
                ),
                CompletedCoursesList(),
                const SizedBox(
                    height: 28,
                ),
            ],
        );
    }
}