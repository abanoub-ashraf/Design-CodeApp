import '../models/course_model.dart';
import 'package:flutter/material.dart';

List<CourseModel> courseSections = [
    CourseModel(
        courseTitle: "Build an app with SwiftUI",
        courseSubtitle: "01 Section",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFF00AEFF),
                Color(0xFF0076FF),
            ],
        ),
        illustration: 'illustration-01.png',
        logo: 'swift-logo.png',
    ),
    CourseModel(
        courseTitle: "Flutter for Designers",
        courseSubtitle: "02 Section",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFFE477AE),
                Color(0xFFC54284),
            ],
        ),
        illustration: 'illustration-08.png',
        logo: 'flutter-logo.png',
    ),
    CourseModel(
        courseTitle: "ProtoPie Prototyping",
        courseSubtitle: "03 Section",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFFEA7E58),
                Color(0xFFCE4E27),
            ],
        ),
        illustration: 'illustration-09.png',
        logo: 'protopie-logo.png',
    ),
    CourseModel(
        courseTitle: "UI Design Course",
        courseSubtitle: "04 Section",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFF72CFD4),
                Color(0xFF42A0C2),
            ],
        ),
        illustration: 'illustration-10.png',
        logo: 'swift-logo.png',
    ),
    CourseModel(
        courseTitle: "React for Designers",
        courseSubtitle: "05 Section",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFFFF2E56),
                Color(0xFFCB012B),
            ],
        ),
        illustration: 'illustration-11.png',
        logo: 'protopie-logo.png',
    ),
    CourseModel(
        courseTitle: "Build an API with Node.JS",
        courseSubtitle: "06 Section",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFF00AEFF),
                Color(0xFF0076FF),
            ],
        ),
        illustration: 'illustration-01.png',
        logo: 'swift-logo.png',
    ),
    CourseModel(
        courseTitle: "Kotlin for Designers",
        courseSubtitle: "07 Section",
        background: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                Color(0xFFE477AE),
                Color(0xFFC54284),
            ],
        ),
        illustration: 'illustration-08.png',
        logo: 'flutter-logo.png',
    ),
];