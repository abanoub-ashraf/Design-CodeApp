import '../components/others/certificates_viewer.dart';
import '../components/lists/continue_watching_list.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ContinueWatchingScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return SlidingUpPanel(
            color: AppColors.kCardPopupBackgroundColor,
            backdropEnabled: true,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(34),
            ),
            boxShadow: const [
                BoxShadow(
                    color: AppColors.kShadowColor,
                    offset: Offset(0, -12),
                    blurRadius: 32,
                ),
            ],
            minHeight: MediaQuery.of(context).size.height * 0.085,
            maxHeight: MediaQuery.of(context).size.height * 0.75,
            panel: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Center(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 16,
                            ),
                            child: Container(
                                width: 42,
                                height: 4,
                                decoration: BoxDecoration(
                                    color: AppColors.continueWatchingScreenTopBorderColor,
                                    borderRadius: BorderRadius.circular(2),
                                ),
                            ),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                        ),
                        child: Text(
                            'Continue Watching', 
                            style: kTitle2Style,
                        ),
                    ),
                    const SizedBox(
                        height: 10,
                    ),
                    ContinueWatchingList(),
                    const SizedBox(
                        height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                        ),
                        child: Text(
                            'Certificates', 
                            style: kTitle2Style,
                        ),
                    ),
                    const SizedBox(
                        height: 10,
                    ),
                    Expanded(
                        child: CertificatesViewer(),
                    ),
                ],
            ),
        );
    }
}