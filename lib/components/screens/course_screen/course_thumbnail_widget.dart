import 'dart:io';

import '../../../models/course_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseThumbnailWidget extends StatelessWidget {
    final CourseModel course;

    const CourseThumbnailWidget({
        required this.course
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SafeArea(
                bottom: false,
                child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                ),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(18),
                                            ),
                                            child: Hero(
                                                tag: course.logo,
                                                child: Image.asset(
                                                    'assets/logos/${course.logo}',
                                                ),
                                            ),
                                        ),
                                        const SizedBox(
                                            width: 20,
                                        ),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                    Hero(
                                                        tag: course.courseSubtitle,
                                                        child: Text(
                                                            course.courseSubtitle, 
                                                            style: kSecondaryCallOutLabelStyle.copyWith(
                                                                color: Colors.white70,
                                                            ),
                                                        ),
                                                    ),
                                                    Hero(
                                                        tag: course.courseTitle,
                                                        child: Text(
                                                            course.courseTitle, 
                                                            style: kLargeTitleStyle.copyWith(
                                                                color: Colors.white,
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                                Navigator.pop(context);
                                            },
                                            child: Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: AppColors.kPrimaryLabelColor.withOpacity(0.8),
                                                ),
                                                child: Icon(
                                                    Platform.isAndroid 
                                                        ? Icons.close 
                                                        : CupertinoIcons.clear,
                                                    color: Colors.white,
                                                )
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                            const SizedBox(
                                height: 28,
                            ),
                            Expanded(
                                child: Hero(
                                    tag: course.illustration,
                                    child: Image.asset(
                                        'assets/illustrations/${course.illustration}',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        width: MediaQuery.of(context).size.width,
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}