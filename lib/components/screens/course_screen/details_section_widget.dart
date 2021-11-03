import 'dart:io';

import '../../../models/course_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsSectionWidget extends StatelessWidget {
    final CourseModel course;

    const DetailsSectionWidget({
        required this.course
    });

    Widget buildRowChild({required IconData androidIcon, required IconData iOSIcon}) {
        return Row(
            children: [
                Container(
                    child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            child: CircleAvatar(
                                child: Icon(
                                    Platform.isAndroid 
                                        ? androidIcon 
                                        : iOSIcon,
                                    color: Colors.white,
                                ),
                                radius: 21,
                                backgroundColor: AppColors.kCourseElementIconColor,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.kBackgroundColor,
                                borderRadius: BorderRadius.circular(29),
                            ),
                        )
                    ),
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                        gradient: course.background,
                        borderRadius: BorderRadius.circular(29),
                    ),
                ),
                const SizedBox(
                    width: 12,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                            '12.4k', 
                            style: kTitle2Style,
                        ),
                        Text(
                            'Comments', 
                            style: kSearchPlaceholderStyle,
                        ),
                    ],
                ),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(
                top: 12,
                left: 28,
                right: 28,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    buildRowChild(
                        androidIcon: Icons.people, 
                        iOSIcon: CupertinoIcons.group_solid,
                    ),
                    buildRowChild(
                        androidIcon: Icons.format_quote, 
                        iOSIcon: CupertinoIcons.news_solid,
                    ),
                ],
            ),
        );
    }
}