import 'dart:io';

import '../components/lists/explore_courses_list.dart';
import '../components/lists/recent_courses_list.dart';
import '../components/screens/home_screen/nav_bar_widget.dart';
import 'continue_watching_screen.dart';
import 'sidebar_screen.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
    ///
    /// this is the animation object that the position in the 
    /// slide transition widget will take  
    ///
    late Animation<Offset> sidebarAnimation;
    
    ///
    /// every animation object should be controlled by animation controller
    ///
    late AnimationController sidebarAnimationController;

    ///
    /// this animation will reverse the side bar sliding in animation
    /// and make it fade out of the screen
    ///
    late Animation<double> fadeAnimation;

    ///
    /// this is for hiding the container that is behind the side bar whenever it's shown 
    /// on the screen so that we can interact with the home page again after the side bar 
    /// is not shown on the screen
    ///
    bool sidebarHidden = true;

    @override
    void initState() {
        super.initState();

        ///
        /// - vsync keeps track of the screen so that flutter doesn't create animations
        ///   when the screen is not being displayed
        /// 
        /// - and for that to happen we need the TickerProviderStateMixin mixin
        /// 
        /// - duration is the amount of time the animation will last
        ///
        sidebarAnimationController = AnimationController(
            vsync: this,
            duration: const Duration(
                milliseconds: 250,
            ),
        );

        ///
        /// - this is the animation itself which is the side bar sliding in on the screen
        /// 
        /// - tween is the type of animation that define the start and the end of the animation
        ///   and the animation action that will happen
        ///
        sidebarAnimation = Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
        ).animate(
            CurvedAnimation(
                parent: sidebarAnimationController, 
                curve: Curves.easeInOut,
            ),
        );

        ///
        /// this animation will fade the side bar out of the screen
        /// and set the opacity from 0 to 1
        ///
        fadeAnimation = Tween<double>(
            begin: 0.0,
            end: 1.0,
        ).animate(
            CurvedAnimation(
                parent: sidebarAnimationController, 
                curve: Curves.easeInOut,
            ),
        );
    }

    ///
    /// dispose objects after creating and using them
    /// to prevent memory leak
    ///
    @override
    void dispose() {
        super.dispose();
        sidebarAnimationController.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                color: AppColors.kBackgroundColor,
                child: Stack(
                    children: [
                            SingleChildScrollView(
                            child: SafeArea(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                    ),
                                    child: Column(
                                        children: [
                                            NavBarWidget(
                                                triggerAnimation: () {
                                                    ///
                                                    /// to control the animation using this variable
                                                    ///
                                                    setState(() {
                                                        sidebarHidden = !sidebarHidden;
                                                    });
                                
                                                    sidebarAnimationController.forward();
                                                },
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                ),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                        Text(
                                                            'Recents',
                                                            style: kLargeTitleStyle,
                                                        ),
                                                        const SizedBox(
                                                            height: 5,
                                                        ),
                                                        Text(
                                                            '23 Courses, More Coming',
                                                            style: kSubtitleStyle,
                                                        ),
                                                    ],
                                                ),
                                            ),
                                            const SizedBox(
                                                height: 20,
                                            ),
                                            RecentCoursesList(),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 25,
                                                    bottom: 16
                                                ),
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    children: [
                                                        Text(
                                                            "Explore",
                                                            style: kTitle1Style,
                                                        ),
                                                    ],
                                                ),
                                            ),
                                            ExploreCoursesList(),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                        ContinueWatchingScreen(),
                        ///
                        /// this is necessary cause after the side bar is gone the home screen
                        /// is not active so we need to ignore the animation when it's hidden
                        ///
                        IgnorePointer(
                            ignoring: sidebarHidden,
                            child: Stack(
                                children: [
                                    ///
                                    /// - this container is the first children in the stack 
                                    ///   that is gonna be behind the second one which is 
                                    ///   the slide transition widget that have the 
                                    ///   side bar screen
                                    /// 
                                    /// - the container has a parent widget which is a gesture detector
                                    ///   to reverse the sliding animation and hide the side bar and 
                                    ///   make it fade out of the screen using its onTap method
                                    /// 
                                    /// - that fade animation will happen after wrap the container
                                    ///   with a fade transition animation widget and create an 
                                    ///   animation object for it above
                                    ///
                                    FadeTransition(
                                        opacity: fadeAnimation,
                                        child: GestureDetector(
                                            child: Container(
                                                color: AppColors.sidebarBackgroundColor,
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                            ),
                                            onTap: () {
                                                setState(() {
                                                    sidebarHidden = !sidebarHidden;
                                                });
                
                                                ///
                                                /// this will reverse the side bar animation object
                                                /// that we defined above
                                                ///
                                                sidebarAnimationController.reverse();
                                            },
                                        ),
                                    ),
                                    ///
                                    /// - this animation widget will help the side bar slide in 
                                    ///   on the screen from the left side
                                    /// 
                                    /// - position is the animation object that well do the sliding
                                    ///
                                    SlideTransition(
                                        position: sidebarAnimation,
                                        child: Platform.isIOS 
                                            ? SafeArea(
                                                child: SidebarScreen(),
                                                bottom: false,
                                            )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                ),
                                                child: SafeArea(
                                                    child: SidebarScreen(),
                                                    bottom: false,
                                                ),
                                            ),
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}