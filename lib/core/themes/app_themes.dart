import 'package:htca_app/constants/exports.dart';
// import 'package:htca_app/gen/fonts.gen.dart';

class AppThemes {
  static const Color _white = Colors.white;
  static const Color _black = AppColors.darkFont;

  static ThemeData darkTheme = ThemeData(
    // applyElevationOverlayColor: false,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primary,
      brightness: Brightness.dark,
      seedColor: AppColors.primary,
      error: AppColors.redColor,
      onPrimary: _black,
      onSecondary: _black,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      shadowColor: AppColors.whiteColor,

    ),
    timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.whiteColor,
        dialBackgroundColor: AppColors.whiteColor,
        hourMinuteColor: AppColors.whiteColor,
        elevation: 0),
    // dividerColor: _white.withOpacity(0.2),
    dividerTheme: DividerThemeData(color: _white.withOpacity(0.2)),
    cardColor: AppColors.cardColorDark,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: _white,
      iconTheme: IconThemeData(color: _white),
      // backgroundColor: Colors.white.withOpacity(0.5),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavbarColor,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: _black,
          displayColor: _black,
      fontFamily: 'Roboto-Regular',
        ),
    // dialogTheme: const DialogTheme(
    //
    //   backgroundColor: AppColors.scaffoldBackgroundDark,
    // ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14, color: _black,fontFamily: 'Roboto-Regular'),
    ),
    scaffoldBackgroundColor: AppColors.secondary,
    // fontFamily: FontFamily.metropolis,
    useMaterial3: true,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      primary: AppColors.primary,
      seedColor: AppColors.primary,
      error: AppColors.redColor,
      onPrimary: _black,
      onSecondary: _black,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: _black,
      iconTheme: IconThemeData(color: _black),
      // backgroundColor: Colors.white.withOpacity(0.5),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavbarColor,
    ),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: _black,
          displayColor: _black,
        ),
    // dialogTheme: const DialogTheme(backgroundColor: _white),
    dividerTheme: DividerThemeData(color: _black.withOpacity(0.2)),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14, color: _black,fontFamily: 'Roboto-Regular'),
    ),
    //fontFamily: FontFamily.metropolis,
    useMaterial3: true,
  );
}
