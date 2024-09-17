import 'package:feeding_application/splash/controller/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<SplashCubit>().startSplashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashCubit, bool>(
          listener: (context, state) {
            if (state == true) {
              context.push('/register');
            }
          },
        )
      ],
      child: Scaffold(
        body: Container(
          color: Colors.amber,
          child: const Center(
            child: Text('Splash Screen'),
          ),
        ),
      ),
    );
  }
}
