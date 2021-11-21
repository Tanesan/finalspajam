import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:finalspajam/pages/top.dart';
import 'package:finalspajam/pages/timeline.dart';
import 'package:finalspajam/pages/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme.light(
              primary: Color(0xffFC7D3C), background: Color(0xfff2f2f7)),
          textTheme: TextTheme(
            headline1: GoogleFonts.roboto(
                fontSize: 40, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            headline2: GoogleFonts.roboto(
                fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            headline3: GoogleFonts.roboto(
                fontSize: 42, color: Colors.black, fontWeight: FontWeight.w600),
            headline4: GoogleFonts.roboto(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.25),
            headline5:
                GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w600),
            headline6: GoogleFonts.roboto(
                fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: 0.15),
            subtitle1: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: 0.15),
            subtitle2: GoogleFonts.roboto(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyText1: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
            bodyText2: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            button: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            caption: GoogleFonts.roboto(
                fontSize: 16,
                color: Color(0xff666666),
                // color: Color(0xffD26919),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4),
            overline: GoogleFonts.roboto(color: Color(0xff666666),
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          )),
      home: Toppage(),
//      home: Search(),
//      home: Timeline(),
      routes: <String, WidgetBuilder>{
        '/timeline': (BuildContext context) => Timeline(),
        '/search': (BuildContext context) => Search(),
      },
    );
  }
}
