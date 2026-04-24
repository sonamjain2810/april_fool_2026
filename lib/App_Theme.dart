import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/SizeConfig.dart';

class AppTheme {
  // default constructor
  AppTheme._();

  // Light Theme Colors
  static const Color _lightIconColor = Colors.grey;
  static const Color _lightPrimaryColor = Colors.white;
  static Color _lightPrimaryVariantColor = Colors.lightGreenAccent[700]!;
  static Color _lightSecondaryColor = Colors.grey;
  static const Color _lightOnPrimaryColor = Colors.black;
  static Color _lightPrimaryIconThemeColor = Colors.lightGreenAccent;
  static const Color _lightButtonTextColor = Colors.white;
  static const Color _lightButtonColor = Colors.lightGreenAccent;
  static Color _lightButtonSplashColor = Colors.green;
  static const Color _lightAppBarTextColor = Colors.white;
  static const Color _lightDividerColor = Colors.black;
  static const Color _lightCardColor = Colors.white70;
  static const Color _lightShadowColor = Colors.lightGreenAccent;

  // Dark Theme Colors
  static Color _darkIconColor = Colors.white;
  static const Color _darkPrimaryColor = Colors.black;
  static Color _darkPrimaryVariantColor = Colors.grey[800]!;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;
  static const Color _darkPrimaryIconThemeColor = Colors.red;
  static const Color _darkButtonTextColor = Colors.white;
  static const Color _darkButtonColor = Colors.red;
  static const Color _darkButtonSplashColor = Colors.blue;
  static const Color _darkAppBarTextColor = Colors.white;
  static const Color _darkDividerColor = Colors.white;
  static const Color _darkCardColor = Colors.grey;
  static const Color _darkShadowColor = Colors.white70;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryColor,

    appBarTheme: AppBarTheme(
      backgroundColor: _lightPrimaryVariantColor,
      foregroundColor: _lightAppBarTextColor,
      elevation: 8.0,
      iconTheme: IconThemeData(
        color: _lightPrimaryColor,
      ),
      titleTextStyle: GoogleFonts.lobster(
        textStyle: _lightAppBarHeadline1TextStyle,
      ),
    ),

    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: _lightSecondaryColor,
      surface: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      onSecondary: _lightOnPrimaryColor,
      onSurface: _lightOnPrimaryColor,
    ).copyWith(
      primaryContainer: _lightPrimaryVariantColor,
    ),

    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),

    primaryIconTheme: IconThemeData(color: _lightPrimaryIconThemeColor),

    textTheme: _lightTextTheme,
    buttonTheme: _lightButtonThemeData,

    // Drawer Color
    canvasColor: _lightPrimaryColor,

    // Divider Color
    dividerColor: _lightDividerColor,

    // Card Color
    cardTheme: _lightCardTheme,

    inputDecorationTheme: _lightInputDecorationTheme,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _lightPrimaryVariantColor,
    ),
  );

  static final InputDecorationTheme _lightInputDecorationTheme =
      InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: _lightPrimaryVariantColor),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: _lightPrimaryVariantColor),
    ),
    hintStyle: GoogleFonts.ptSans(textStyle: _lightScreenBodyText1TextStyle),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  );

  // Light Appbar text Styling
  static final TextStyle _lightAppBarHeadline1TextStyle = const TextStyle(
    color: _lightAppBarTextColor,
  );

  static final ButtonThemeData _lightButtonThemeData = ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: _lightButtonColor,
    splashColor: _lightButtonSplashColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  // Button text Styling
  static final TextStyle _lightButtonTextTextStyle = TextStyle(
    fontSize: 1.56 * SizeConfig.textMultiplier,
    color: _lightButtonTextColor,
  );

  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.oswald(textStyle: _lightScreenHeading1TextStyle),
    bodyLarge: GoogleFonts.ptSans(textStyle: _lightScreenBodyText1TextStyle),
    bodyMedium: GoogleFonts.ptSans(textStyle: _lightScreenBodyText2TextStyle),
    titleMedium: GoogleFonts.ptSans(textStyle: _lightScreenSubTitle1TextStyle),
    titleSmall: GoogleFonts.ptSans(textStyle: _lightScreenSubTitle2TextStyle),
    labelLarge: GoogleFonts.ptSans(textStyle: _lightButtonTextTextStyle),
  );

  // Text headline1 styling
  static final TextStyle _lightScreenHeading1TextStyle = TextStyle(
    fontSize: 2.68 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.bold,
    color: _lightOnPrimaryColor,
    letterSpacing: 1,
  );

  // Text bodyText1 styling
  static final TextStyle _lightScreenBodyText1TextStyle = TextStyle(
    fontSize: 2.23 * SizeConfig.textMultiplier,
    color: _lightOnPrimaryColor,
    letterSpacing: .5,
  );

  // Text bodyText2 styling
  static final TextStyle _lightScreenBodyText2TextStyle = TextStyle(
    fontSize: 2 * SizeConfig.textMultiplier,
    color: _lightPrimaryColor,
    letterSpacing: .5,
  );

  static final TextStyle _lightScreenSubTitle1TextStyle = TextStyle(
    fontSize: 1.79 * SizeConfig.textMultiplier,
    color: _lightOnPrimaryColor,
    letterSpacing: .3,
  );

  static final TextStyle _lightScreenSubTitle2TextStyle = TextStyle(
    fontSize: 1.60 * SizeConfig.textMultiplier,
    color: _lightOnPrimaryColor,
    letterSpacing: .10,
  );

  static final CardThemeData _lightCardTheme = CardThemeData(
    elevation: 6.0,
    color: _lightCardColor,
    shadowColor: _lightShadowColor,
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryColor,

    appBarTheme: AppBarTheme(
      backgroundColor: _darkPrimaryVariantColor,
      foregroundColor: _darkAppBarTextColor,
      elevation: 8.0,
      iconTheme: const IconThemeData(
        color: _darkOnPrimaryColor,
      ),
      titleTextStyle: GoogleFonts.lobster(
        textStyle: _darkAppBarHeadline1TextStyle,
      ),
    ),

    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      secondary: _darkSecondaryColor,
      surface: _darkPrimaryColor,
      onPrimary: _darkOnPrimaryColor,
      onSecondary: _darkOnPrimaryColor,
      onSurface: _darkOnPrimaryColor,
    ).copyWith(
      primaryContainer: _darkPrimaryVariantColor,
    ),

    iconTheme: IconThemeData(
      color: _darkIconColor,
    ),

    primaryIconTheme: const IconThemeData(color: _darkPrimaryIconThemeColor),

    textTheme: _darkTextTheme,

    buttonTheme: _darkButtonThemeData,

    // Drawer Color
    canvasColor: _darkPrimaryColor,

    // Divider Color
    dividerColor: _darkDividerColor,

    // Card theme
    cardTheme: _darkCardTheme,

    inputDecorationTheme: _darkInputDecorationTheme,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _darkPrimaryVariantColor,
    ),
  );

  static final InputDecorationTheme _darkInputDecorationTheme =
      InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: _darkPrimaryVariantColor),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: _darkPrimaryVariantColor),
    ),
    hintStyle: GoogleFonts.ptSans(textStyle: _darkScreenBodyText1TextStyle),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
  );

  static final TextStyle _darkAppBarHeadline1TextStyle =
      _lightAppBarHeadline1TextStyle.copyWith(
    color: _darkAppBarTextColor,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.oswald(textStyle: _darkScreenHeading1TextStyle),
    bodyLarge: GoogleFonts.ptSans(textStyle: _darkScreenBodyText1TextStyle),
    titleMedium: GoogleFonts.ptSans(textStyle: _darkScreenSubTitle1TextStyle),
    titleSmall: GoogleFonts.ptSans(textStyle: _darkScreenSubTitle2TextStyle),
    labelLarge: GoogleFonts.ptSans(textStyle: _darkButtonTextTextStyle),
  );

  // Text headline1 styling
  static final TextStyle _darkScreenHeading1TextStyle =
      _lightScreenHeading1TextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );

  // Text bodyText1 styling
  static final TextStyle _darkScreenBodyText1TextStyle =
      _lightScreenBodyText1TextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );

  // Text subTitle1 styling
  static final TextStyle _darkScreenSubTitle1TextStyle =
      _lightScreenSubTitle1TextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );

  // Text subTitle2 styling
  static final TextStyle _darkScreenSubTitle2TextStyle =
      _lightScreenSubTitle2TextStyle.copyWith(
    color: _darkOnPrimaryColor,
  );

  // Button Theme
  static final ButtonThemeData _darkButtonThemeData =
      _lightButtonThemeData.copyWith(
    buttonColor: _darkButtonColor,
    splashColor: _darkButtonSplashColor,
  );

  // Dark Button text Styling
  static final TextStyle _darkButtonTextTextStyle =
      _lightButtonTextTextStyle.copyWith(
    color: _darkButtonTextColor,
  );

  static CardThemeData get _darkCardTheme => _lightCardTheme.copyWith(
        color: _darkCardColor,
        shadowColor: _darkShadowColor,
      );

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
