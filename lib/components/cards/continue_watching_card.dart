import '../../models/course_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContinueWatchingCard extends StatelessWidget {
    final CourseModel course;

    const ContinueWatchingCard({
        required this.course
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            alignment: Alignment.topCenter,
            child: Stack(
                alignment: Alignment.topRight,
                children: [ 
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 20,
                            right: 20,
                        ), 
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: course.background,
                                borderRadius: BorderRadius.circular(41),
                                boxShadow: [
                                    BoxShadow(
                                        color: course.background.colors[0].withOpacity(0.3),
                                        offset: const Offset(0, 20),
                                        blurRadius: 15,
                                    ),
                                    BoxShadow(
                                        color: course.background.colors[1].withOpacity(0.3),
                                        offset: const Offset(0, 20),
                                        blurRadius: 15,
                                    ),
                                ],
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(41),
                                child: Container(
                                    height: 140,
                                    width: 260,
                                    child: Stack(
                                        children: [
                                            Row(
                                                children: [
                                                    const Spacer(),
                                                    Column(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                            Image.asset(
                                                                'assets/illustrations/${course.illustration}',
                                                                fit: BoxFit.cover,
                                                                height: 110,
                                                            ),
                                                        ],
                                                    ),
                                                ],
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(24),
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
                                        ],
                                    ),
                                ),
                            ),
                        ),
                    ),
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                                BoxShadow(
                                    color: AppColors.kShadowColor,
                                    offset: Offset(0, 4),
                                    blurRadius: 16,
                                ),
                            ],
                        ),
                        padding: const EdgeInsets.only(
                            top: 12.5,
                            bottom: 13.5, 
                            left: 20.5,
                            right: 14.5,
                        ),
                        child: Image.asset(AppAssets.playIcon),
                    ),
                ],
            ),
        );
    }
}