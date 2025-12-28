import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/course_service.dart';
import 'data/auth_service.dart';
import 'viewmodels/course_view_model.dart';
import 'viewmodels/auth_view_model.dart';
import 'views/course/course_view.dart';
import 'views/auth/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(
            authService: AuthService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CourseViewModel(
            service: CourseService(),
          ),
        ),
      ],
      child: Consumer<AuthViewModel>(
        builder: (context, authViewModel, _) {
          return MaterialApp(
            title: 'Torii Nihongo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFC8102E), // Japanese Red (Torii Red)
                brightness: Brightness.light,
                primary: const Color(0xFFC8102E),
                secondary: const Color(0xFF1E88E5),
                surface: Colors.white,
              ),
              textTheme: GoogleFonts.notoSansTextTheme(
                ThemeData.light().textTheme,
              ).copyWith(
                headlineLarge: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                headlineMedium: GoogleFonts.notoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                titleLarge: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
                bodyLarge: GoogleFonts.notoSans(
                  fontSize: 16,
                ),
                bodyMedium: GoogleFonts.notoSans(
                  fontSize: 14,
                ),
                bodySmall: GoogleFonts.notoSans(
                  fontSize: 12,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFFC8102E),
                    width: 2,
                  ),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            home: authViewModel.isAuthenticated
                ? const CourseView()
                : const LoginScreen(),
          );
        },
      ),
    );
  }
}

