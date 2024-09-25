import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More Screen',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.midnightBlue,
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.grey),
                  title: Text('Settings'),
                  /*onTap: () {
                    // Add navigation to Settings page or functionality here
                  },*/
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.grey),
                  title: Text('Notifications'),
                 /* onTap: () {
                    // Add navigation to Notifications page or functionality here
                  },*/
                ),
                Divider(),
                Spacer(),
                Center(
                  child: Text(
                    'Version Number : v 0.1.0 +2',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

