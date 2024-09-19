import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More Screen',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.midnightBlue,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(padding: EdgeInsets.all(20))),
    );
  }
}
