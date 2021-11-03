import '../cards/explore_courses_card.dart';
import '../../data/explore_courses_data.dart';
import 'package:flutter/material.dart';

class ExploreCoursesList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Container(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: exploreCourses.length,
                itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: 10,
                        ),
                        child: ExploreCoursesCard(
                            course: exploreCourses[index],
                        ),
                    );
                }
            ),
        );
    }
}