import 'package:flutter/material.dart';

class CourseModel {
    String courseTitle;
    String courseSubtitle;
    LinearGradient background;
    String illustration;
    String logo;

    CourseModel({
        required this.courseTitle,
        required this.courseSubtitle,
        required this.background,
        required this.illustration,
        required this.logo,
    });
}