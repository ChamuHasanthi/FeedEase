import 'package:feeding_application/core/bloc/user_type_cubit.dart';
import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  final Widget child;
  const HomeView({super.key, required this.child});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // final List<String> _tabs = ['/jobs', '/bins', '/create-request', '/more'];
  List<String> _tabs = [];
  final List<String> _tabsRestaurant = ['/create-request', '/more'];
  final List<String> _tabsEmployer = ['/jobs', '/bins', '/more'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    context.go(_tabs[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar:
          BlocBuilder<UserTypeCubit, UserType>(builder: (context, state) {
        List<BottomNavigationBarItem> itemsRestaurant = [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.create_rounded,
            ),
            label: 'Requests',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz_rounded,
            ),
            label: 'More',
          ),
        ];
        List<BottomNavigationBarItem> itemsEmployer = [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.cases_rounded,
            ),
            label: 'Jobs',
          ),
          const BottomNavigationBarItem(
            icon: const Icon(
              Icons.leaderboard_rounded,
            ),
            label: 'Bin Level',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.more_horiz_rounded,
            ),
            label: 'More',
          ),
        ];

        if (state == UserType.employer) {
          _tabs = _tabsEmployer;
        } else if (state == UserType.restaurant) {
          _tabs = _tabsRestaurant;
        }

        return BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: AppColors.azureBlue,
          unselectedItemColor: AppColors.white,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.midnightBlue,

          items: state == UserType.employer ? itemsEmployer : itemsRestaurant,
          
        );
      }),
    );
  }
}
