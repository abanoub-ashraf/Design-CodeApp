import '../components/screens/course_screen/buttons_section_widget.dart';
import '../components/screens/course_screen/course_thumbnail_widget.dart';
import '../components/screens/course_screen/details_section_widget.dart';
import '../components/screens/course_screen/info_section_widget.dart';
import '../components/screens/course_screen/play_icon_widget.dart';
import '../models/course_model.dart';
import 'course_sections_screen.dart';
import '../utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CourseScreen extends StatefulWidget {
    final CourseModel course;

    const CourseScreen({
        required this.course
    });

    @override
    _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
    late PanelController panelController;

    @override
    void initState() {
        super.initState();
        panelController = PanelController();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                color: AppColors.kBackgroundColor,
                child: SlidingUpPanel(
                    panel: CourseSectionsScreen(),
                    controller: panelController,
                    backdropEnabled: true,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(34),
                    ),
                    color: AppColors.kCardPopupBackgroundColor,
                    boxShadow: const [
                        BoxShadow(
                            color: AppColors.kShadowColor,
                            offset: Offset(0, -12),
                            blurRadius: 32,
                        ),
                    ],
                    minHeight: 0,
                    maxHeight: MediaQuery.of(context).size.height * 0.95,
                    ///
                    /// - the body is what will appear underneath the panel filling the screen
                    /// 
                    /// - the panel is the content of the sliding panel itself
                    ///
                    body: SingleChildScrollView(
                        child: Column(
                            children: [
                                Stack(
                                    alignment: Alignment.bottomRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20,
                                            ),
                                            child: Container(
                                                height: MediaQuery.of(context).size.height * 0.5,
                                                decoration: BoxDecoration(
                                                    gradient: widget.course.background,
                                                ),
                                            ),
                                        ),
                                        CourseThumbnailWidget(
                                            course: widget.course,
                                        ),
                                        PlayIconWidget(),
                                    ],
                                ),
                                DetailsSectionWidget(
                                    course: widget.course,
                                ),
                                ButtonsSectionWidget(
                                    panelController: panelController,
                                ),
                                InfoSectionWidget(),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}