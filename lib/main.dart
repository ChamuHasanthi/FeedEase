import 'package:feeding_application/core/routes/routes.dart';
import 'package:feeding_application/core/themeData/styles/elevated_button_theme.dart';
import 'package:feeding_application/core/themeData/styles/input_decoration_theme.dart';
import 'package:feeding_application/splash/controller/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
        )
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
