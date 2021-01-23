
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

import 'package:codefy_app/pages/pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    final primaryColor = HexColor('#2E3738');
    final primaryColorDark = HexColor('#2E3738');
    final primaryColorLight = HexColor('#785DFE');
    final title = 'Codefy';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        primaryColorLight: primaryColorLight,
        accentColor: primaryColor,
        backgroundColor: primaryColorDark,
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: primaryColorDark,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Icons.home,
        nextScreen: Home(title: title),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.scale,
        backgroundColor: primaryColor
      ),
    );
  }
}
