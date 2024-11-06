import 'package:flutter/material.dart';
import 'package:expnc/widgets/expenses.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // // SystemChrome.setPreferredOrientations([
  // //   DeviceOrientation.portraitUp
  // // ]).then((fn) {
  // // });
  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: kColorScheme,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        labelLarge: TextStyle(fontSize: 16, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: kColorScheme.primaryContainer,
        foregroundColor: kColorScheme.onPrimaryContainer,
        elevation: 2,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      cardTheme: CardTheme(
        color: kColorScheme.secondaryContainer,
        shadowColor: kColorScheme.shadow,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: kColorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        fillColor: kColorScheme.surfaceVariant,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 247, 247, 247), width: 2),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kColorScheme.primaryContainer,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: kColorScheme.onPrimaryContainer.withOpacity(0.7),
        showUnselectedLabels: true,
        elevation: 10,
      ),
      scaffoldBackgroundColor: kColorScheme.background,
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}

const kColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF6A1B9A),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFE1BEE7),
  onPrimaryContainer: Color(0xFF4A148C),
  secondary: Color.fromARGB(255, 49, 193, 229),
  onSecondary: Colors.white,
  secondaryContainer: Color(0xFFC8E6C9),
  onSecondaryContainer: Color(0xFF1B5E20),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF333333),
  background: Color(0xFFF3F2F7),
  onBackground: Color(0xFF212121),
  error: Color(0xFFB00020),
  onError: Colors.white,
  surfaceVariant: Color(0xFFEDE7F6),
  shadow: Color(0xFF4A148C),
);
// // const kColorScheme = ColorScheme(
// //   brightness: Brightness.light,
// //   primary: Color(0xFF00897B), // Teal
// //   onPrimary: Colors.white,
// //   primaryContainer: Color(0xFFB2DFDB), // Light Teal for surfaces or accent
// //   onPrimaryContainer: Color(0xFF004D40), // Dark Teal
// //   secondary: Color.fromARGB(255, 8, 169, 249), // Amber
// //   onSecondary: Colors.white,
// //   secondaryContainer: Color(0xFFFFF3E0), // Light Amber for cards or highlights
// //   onSecondaryContainer: Color(0xFF795548), // Dark Brown accent
// //   surface: Color(0xFFF4F4F9), // Light Gray for background
// //   onSurface: Color(0xFF333333), // Dark Gray for text
// //   background: Color(0xFFF4F4F9), // Background color matching the surface
// //   onBackground: Color(0xFF333333), // Text color
// //   error: Color(0xFFD32F2F), // Error Red
// //   onError: Colors.white,
// //   surfaceVariant: Color(0xFFE0F2F1), // Variant of teal for extra elements
// //   shadow: Color(0xFF004D40), // Dark teal shadow for depth
// // // );
// const kColorScheme = ColorScheme(
//   brightness: Brightness.light,

//   primary: Color(0xFF005B96), // Deep modern blue for trust and calm
//   onPrimary:
//       Colors.white, // White for high contrast on buttons or text over primary

//   primaryContainer:
//       Color(0xFF9BC5E8), // Soft blue for subtle accents or backgrounds
//   onPrimaryContainer:
//       Color(0xFF003B63), // Darker blue for text over primaryContainer

//   secondary:
//       Color(0xFFFFC857), // Vibrant yellow for positive highlights and accents
//   onSecondary: Color(0xFF1E1E1E), // Dark gray for high contrast over yellow

//   secondaryContainer:
//       Color(0xFFFFE4B5), // Soft muted yellow for lighter surfaces
//   onSecondaryContainer: Color(0xFF6D4C00), // Warm brown for accents on yellow

//   surface: Color(0xFFF7F8FA), // Light gray for background and cards
//   onSurface: Color(0xFF2E2E2E), // Dark gray for text to ensure readability

//   background: Color(0xFFF7F8FA), // Same light gray for consistent background
//   onBackground: Color(0xFF2E2E2E), // Dark gray for consistent readability

//   error: Color(0xFFD9534F), // Soft red for errors without being too harsh
//   onError: Colors.white, // High contrast for error text

//   surfaceVariant:
//       Color(0xFFB2D8F2), // Light blue variant for additional elements
//   shadow: Color(
//       0xFF003B63), // Dark blue shadow for depth and consistency with primary
// );
