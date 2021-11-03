import 'package:design_code_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                    return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        // theme: ThemeData.light().copyWith(
                        // ),
                        // darkTheme: ThemeData.dark().copyWith(
                        // ),
                        home: LoginScreen() 
                    );
                } else {
                    return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        home: Scaffold(
                            body: Container(),
                        ),
                    );
                }
            },
        );
    }
}