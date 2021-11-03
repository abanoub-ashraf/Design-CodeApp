import '../cards/recent_courses_card.dart';
import '../../data/recent_courses_data.dart';
import '../../screens/course_screen.dart';
import '../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class RecentCoursesList extends StatefulWidget {
    @override
    _RecentCoursesListState createState() => _RecentCoursesListState();
}

class _RecentCoursesListState extends State<RecentCoursesList> {
    List<Container> indicators = [];
    int currentPage = 0;

    Widget updateIndicators() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ...recentCourses.map((course) {
                    final index = recentCourses.indexOf(course);
                    return Container(
                        width: 7,
                        height: 7,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentPage == index 
                                ? AppColors.activeIndicator 
                                : AppColors.inActiveIndicator,
                        ),
                    );
                }).toList(),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                Container(
                    height: 320,
                    width: double.infinity,
                    child: PageView.builder(
                        itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CourseScreen(
                                                course: recentCourses[index],
                                            ),
                                            fullscreenDialog: true,
                                        ),
                                    );
                                },
                                child: Opacity(
                                    opacity: currentPage == index ? 1.0 : 0.5,
                                    child: RecentCourseCard(
                                        course: recentCourses[index],
                                    )
                                ),
                            );
                        },
                        itemCount: recentCourses.length,
                        controller: PageController(
                            initialPage: 0, 
                            viewportFraction: 0.63,
                        ),
                        onPageChanged: (index) {
                            setState(() {
                                currentPage = index;
                            });
                        },
                    ),
                ),
                updateIndicators(),
            ],
        );
    }
}