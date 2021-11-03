import '../../models/course_model.dart';
import '../../utils/app_styles.dart';
import 'package:flutter/material.dart';

class ExploreCoursesCard extends StatelessWidget {
    final CourseModel course;

    const ExploreCoursesCard({required this.course});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(
                right: 10,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(41),
                child: Container(
                    height: 120,
                    width: 280,
                    decoration: BoxDecoration(
                        gradient: course.background,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 32,
                        ),
                        child: Row(
                            children: [
                                Expanded(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                                course.courseSubtitle,
                                                style: kCardSubtitleStyle,
                                            ),
                                            const SizedBox(
                                                height: 6,
                                            ),
                                            Text(
                                                course.courseTitle,
                                                style: kCardTitleStyle,
                                            ),
                                        ]
                                    ),
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        Image.asset(
                                            'assets/illustrations/${course.illustration}',
                                            fit: BoxFit.cover,
                                            height: 100,
                                        ),
                                    ],
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}