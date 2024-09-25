import 'package:feeding_application/core/bloc/user_type_cubit.dart';
import 'package:feeding_application/core/routes/routes.dart';
import 'package:feeding_application/core/themeData/styles/elevated_button_theme.dart';
import 'package:feeding_application/core/themeData/styles/input_decoration_theme.dart';
import 'package:feeding_application/splash/controller/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core

void main() async {
  // Ensure that Firebase is initialized before the app starts
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return SplashCubit();
          },
        ),
        BlocProvider(create: (_) {
          return UserTypeCubit();
        })
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          fontFamily: 'RobotoSlab',
          elevatedButtonTheme: elevatedButtonThemeData,
          inputDecorationTheme: inputDecorationTheme,
        ),
      ),
    );
  }
}
