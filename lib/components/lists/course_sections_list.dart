import '../cards/course_sections_card.dart';
import '../../data/course_sections_data.dart';
import '../../utils/app_styles.dart';
import 'package:flutter/material.dart';

class CourseSectionsList extends StatelessWidget {
    List<Widget> coursesSectionWidget() {
        final List<Widget> cards = [];

        for (final course in courseSections) {
            cards.add(
                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20,
                    ),
                    child: CourseSectionsCard(
                        course: course,
                    ),
                ),
            );
        }

        cards.add(
            Padding(
                padding: const EdgeInsets.only(
                    top: 12,
                ),
                child: Text(
                    'No more Sections to view, look\nfor more in our courses',
                    style: kCaptionLabelStyle,
                    textAlign: TextAlign.center,
                ),
            )
        );

        return cards;
    }

    @override
    Widget build(BuildContext context) {
        return Expanded(
            child: ListView(
                children: coursesSectionWidget(),
            ),
        );
    }
}