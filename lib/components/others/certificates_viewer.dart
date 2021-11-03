import 'dart:math';

import '../../utils/app_assets.dart';
import 'package:flutter/material.dart';

class CertificatesViewer extends StatefulWidget {
    @override
    _CertificatesViewerState createState() => _CertificatesViewerState();
}

class _CertificatesViewerState extends State<CertificatesViewer> {
    ///
    /// we will convert this list of strings (assets names of the certificates)
    /// into a list of widgets that goes in a stack widget
    ///
    final List<String> certificatePath = [
        AppAssets.certificate1,
        AppAssets.certificate2,
        AppAssets.certificate3,
    ];

    ///
    /// this will be the new converted list of widgets that will be 
    /// the children of the stack
    ///
    late List<Widget> imageChildren = [];

    ///
    /// this is the widget that we wanna convert it into a stack
    ///
    late Widget certificatesViewer;

    Widget buildStackWidget() {
        ///
        /// this list of strings will be converted as a map,
        /// then we will loop throw each pair in that map accessing the certificate value
        /// which is the string value and put it inside an image widget so we get list of images
        /// widgets that will go in the stack we wanna create
        ///
        certificatePath.reversed.toList().asMap().forEach((index, certificate) {
            ///
            /// starting from this variable we will rotate the images widgets inside 
            /// the stack each one will have different angel
            ///
            int angleDegree;

            ///
            /// - set the angle of the last image child in the stack
            /// 
            /// - and the other children will have random numbers for the angles
            ///
            if (index == certificatePath.length - 1) {
                angleDegree = 4;
            } else {
                angleDegree = Random().nextInt(10) - 5;
            }

            imageChildren.add(
                Transform.rotate(
                    angle: angleDegree * (pi / 180),
                    child: Image.asset(
                        certificate, 
                        alignment: Alignment.center, 
                        fit: BoxFit.cover,
                    ),
                ),
            );
        });

        ///
        /// create the stack using the new images widgets list we got above
        ///
        return certificatesViewer = Stack(children: imageChildren,);
    }

    @override
    void initState() {
        super.initState();

        buildStackWidget();
    }

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(top: 20,),
            child: certificatesViewer,
        );
    }
}