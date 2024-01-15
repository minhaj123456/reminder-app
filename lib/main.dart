import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:task/constants.dart';
import 'package:task/entry_blok.dart';
import 'package:task/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NewEntryBloc? newEntryBloc;
  @override
  void initState() {
    newEntryBloc = NewEntryBloc();

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<NewEntryBloc>.value(
        value: newEntryBloc!,
        child: Sizer(builder: (context, Orientation, DeviceType) {
          return MaterialApp(
            title: "reminder",
            theme: ThemeData.dark().copyWith(
                primaryColor: kPrimaryColor,
                scaffoldBackgroundColor: kScaffoldColor,
                appBarTheme: AppBarTheme(
                    toolbarHeight: 7.h,
                    backgroundColor: kScaffoldColor,
                    elevation: 0,
                    iconTheme: IconThemeData(
                      color: kSecondaryColor,
                      size: 20.sp,
                    ),
                    titleTextStyle: GoogleFonts.mulish(
                        color: kTextColor,
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.sp)),
                textTheme: TextTheme(
                    headline3: TextStyle(
                        fontSize: 29.sp,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w500),
                    headline4: GoogleFonts.aBeeZee(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                      color: kTextColor,
                    ),
                    subtitle2:
                        GoogleFonts.poppins(fontSize: 12.sp, color: kTextColor),
                    caption: GoogleFonts.poppins(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor),
                    labelMedium: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColor)),
                inputDecorationTheme: const InputDecorationTheme(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: kTextLightColor,
                      width: 0.7,
                    )),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: kTextLightColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: kPrimaryColor,
                    ))),
                timePickerTheme: TimePickerThemeData(
                  backgroundColor: kScaffoldColor,
                  hourMinuteColor: kTextColor,
                  hourMinuteTextColor: kScaffoldColor,
                  dayPeriodColor: kTextColor,
                  dayPeriodTextColor: kScaffoldColor,
                  dialBackgroundColor: kTextColor,
                  dialHandColor: kScaffoldColor,
                  dialTextColor: kTextColor,
                  entryModeIconColor: kOtherColor,
                  dayPeriodTextStyle: GoogleFonts.aBeeZee(
                    fontSize: 8.sp,
                  ),
                )),
            home: homepages(),
          );
        }));
  }
}
