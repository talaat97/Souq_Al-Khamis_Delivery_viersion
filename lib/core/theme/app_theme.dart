import 'package:flutter/material.dart';

class AppColor {
  // Base Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF64748B);
  static Color? grey200 = Colors.grey[200];
  static Color? grey600 = Colors.grey[600];

  // Primary & Brand Colors
  static const Color primaryColor = Color(0xFFDB6719);
  static const Color secondaryColor = Color(0xFF2C5F7D);
  static const Color accentColor = Color(0xFF4A9B9F);
  static const Color tertiaryColor = Color(0xFFF9A654);

  // Neutral Palette
  static const Color neutralDark = Color(0xFF1E293B);
  static const Color neutralMedium = Color(0xFF64748B);
  static const Color neutralLight = Color(0xFFE2E8F0);
  static const Color neutralBG = Color(0xFFF8FAFC);

  // Surface & Background
  static const Color backgroundColor = Color(0xFFFFF9F5);
  static const Color surfaceColor = Color(0xFFFFF3E9);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textTertiary = Color(0xFF94A3B8);

  // Semantic Colors
  static const Color successColor = Color(0xFF10B981);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color infoColor = Color(0xFF3B82F6);

  // Legacy Support Colors
  static const Color blueColor = Color(0xFF3B82F6);
  static const Color accentOlive = Color(0xFF4A9B9F);
  static const Color redColor = Color(0xFFEF4444);
  static const Color greenColor = Color(0xFF10B981);
  static const Color green2Color = Color(0xFF059669);
  static const Color yellowColor = Color(0xFFF59E0B);
}

class OrderStatusColor {
  static const Color waiting = Color(0xFF8B5CF6);
  static const Color approve = Color(0xFF10B981);
  static const Color preparing = Color(0xFFF59E0B);
  static const Color shipping = Color(0xFFDB6719);
  static const Color archived = Color(0xFF64748B);
}

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class TextStyles {
  // Heading Styles
  static TextStyle font32OrangeBold = const TextStyle(fontSize: 32, fontWeight: FontWeightHelper.bold, color: AppColor.primaryColor);
  static TextStyle font24BlackBold = const TextStyle(fontSize: 24, fontWeight: FontWeightHelper.bold, color: AppColor.textPrimary);
  static TextStyle font24OrangeBold = const TextStyle(fontSize: 24, fontWeight: FontWeightHelper.bold, color: AppColor.primaryColor);
  static TextStyle font18DarkBlueBold = const TextStyle(fontSize: 18, fontWeight: FontWeightHelper.bold, color: AppColor.secondaryColor);
  static TextStyle font18DarkBlueSemiBold = const TextStyle(fontSize: 18, fontWeight: FontWeightHelper.semiBold, color: AppColor.secondaryColor);

  // Body Text Styles
  static TextStyle font16WhiteSemiBold = const TextStyle(fontSize: 16, fontWeight: FontWeightHelper.semiBold, color: AppColor.white);
  static TextStyle font16WhiteMedium = const TextStyle(fontSize: 16, fontWeight: FontWeightHelper.medium, color: AppColor.white);
  static TextStyle font18WhiteMedium = const TextStyle(fontSize: 18, fontWeight: FontWeightHelper.medium, color: AppColor.white);
  static TextStyle font15DarkBlueMedium = const TextStyle(fontSize: 15, fontWeight: FontWeightHelper.medium, color: AppColor.secondaryColor);
  static TextStyle font14DarkBlueMedium = const TextStyle(fontSize: 14, fontWeight: FontWeightHelper.medium, color: AppColor.secondaryColor);
  static TextStyle font14DarkBlueBold = const TextStyle(fontSize: 14, fontWeight: FontWeightHelper.bold, color: AppColor.secondaryColor);
  static TextStyle font14OrangeSemiBold = const TextStyle(fontSize: 14, fontWeight: FontWeightHelper.semiBold, color: AppColor.primaryColor);

  // Small & Label Text Styles
  static TextStyle font13OrangeSemiBold = const TextStyle(fontSize: 13, fontWeight: FontWeightHelper.semiBold, color: AppColor.primaryColor);
  static TextStyle font13DarkBlueMedium = const TextStyle(fontSize: 13, fontWeight: FontWeightHelper.medium, color: AppColor.secondaryColor);
  static TextStyle font13DarkBlueRegular = const TextStyle(fontSize: 13, fontWeight: FontWeightHelper.regular, color: AppColor.secondaryColor);
  static TextStyle font13OrangeRegular = const TextStyle(fontSize: 13, fontWeight: FontWeightHelper.regular, color: AppColor.primaryColor);
  static TextStyle font12OrangeRegular = const TextStyle(fontSize: 12, fontWeight: FontWeightHelper.regular, color: AppColor.primaryColor);
  static TextStyle font12DarkBlueRegular = const TextStyle(fontSize: 12, fontWeight: FontWeightHelper.regular, color: AppColor.secondaryColor);

  // Gray/Neutral Text Styles
  static TextStyle font14GrayRegular = const TextStyle(fontSize: 14, fontWeight: FontWeightHelper.regular, color: AppColor.textSecondary);
  static TextStyle font14LightGrayRegular = const TextStyle(fontSize: 14, fontWeight: FontWeightHelper.regular, color: AppColor.textTertiary);
  static TextStyle font13GrayRegular = const TextStyle(fontSize: 13, fontWeight: FontWeightHelper.regular, color: AppColor.textSecondary);
  static TextStyle font12GrayRegular = const TextStyle(fontSize: 12, fontWeight: FontWeightHelper.regular, color: AppColor.textSecondary);
  static TextStyle font12GrayMedium = const TextStyle(fontSize: 12, fontWeight: FontWeightHelper.medium, color: AppColor.textSecondary);
}

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColor.backgroundColor, Color(0xFFFFF6EF)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -100, right: -60,
            child: Container(
              width: 350, height: 350,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColor.primaryColor.withOpacity(0.12), Colors.transparent])),
            ),
          ),
          Positioned(
            bottom: -80, left: -50,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColor.accentColor.withOpacity(0.08), Colors.transparent])),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3, right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              width: 200, height: 200,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColor.secondaryColor.withOpacity(0.04), Colors.transparent])),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class AppTheme {
  static ThemeData themeEnglish = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    fontFamily: 'Lato',
    primaryColor: AppColor.primaryColor,
    secondaryHeaderColor: AppColor.secondaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
      elevation: 6,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColor.primaryColor,
      centerTitle: true,
      elevation: 4,
      shadowColor: Color(0x40DB6719),
      titleTextStyle: TextStyle(color: AppColor.white, fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Lato', letterSpacing: 0.5),
      iconTheme: IconThemeData(color: AppColor.white),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColor.primaryColor,
      unselectedLabelColor: AppColor.neutralMedium,
      indicatorColor: AppColor.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Lato'),
      unselectedLabelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Lato'),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColor.textPrimary, letterSpacing: 0.3),
      headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColor.textPrimary),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, height: 1.5, color: AppColor.textSecondary),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColor.textSecondary),
      labelMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.textTertiary),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primaryColor,
      secondary: AppColor.accentColor,
      error: AppColor.errorColor,
      surface: AppColor.cardBackground,
      background: AppColor.backgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 3,
        shadowColor: AppColor.primaryColor.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColor.cardBackground,
      elevation: 2,
      shadowColor: AppColor.neutralDark.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColor.primaryColor, width: 2)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColor.errorColor, width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColor.errorColor, width: 2)),
    ),
  );

  static ThemeData themeArabic = ThemeData(
    fontFamily: 'Rubik',
    scaffoldBackgroundColor: AppColor.backgroundColor,
    primaryColor: AppColor.primaryColor,
    secondaryHeaderColor: AppColor.secondaryColor,
    appBarTheme: const AppBarTheme(
      color: AppColor.primaryColor,
      centerTitle: true,
      elevation: 4,
      shadowColor: Color(0x40DB6719),
      titleTextStyle: TextStyle(color: AppColor.white, fontSize: 26, fontWeight: FontWeight.w600, fontFamily: 'Rubik', letterSpacing: 0.3),
      iconTheme: IconThemeData(color: AppColor.white),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColor.primaryColor,
      unselectedLabelColor: AppColor.neutralMedium,
      indicatorColor: AppColor.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Rubik'),
      unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Rubik'),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColor.textPrimary, letterSpacing: 0.2),
      headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColor.textPrimary),
      bodyLarge: TextStyle(fontSize: 16, height: 1.6, color: AppColor.textSecondary),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColor.textSecondary),
      labelMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.textTertiary),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primaryColor,
      secondary: AppColor.accentColor,
      error: AppColor.errorColor,
      surface: AppColor.cardBackground,
      background: AppColor.backgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 3,
        shadowColor: AppColor.primaryColor.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.3),
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColor.cardBackground,
      elevation: 2,
      shadowColor: AppColor.neutralDark.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColor.neutralLight, width: 1.5)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColor.primaryColor, width: 2)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColor.errorColor, width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColor.errorColor, width: 2)),
    ),
  );
}
