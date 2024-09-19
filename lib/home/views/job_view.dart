import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Jobs',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.midnightBlue,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            JobCard(
              restaurantName: 'Restaurant 1',
              weight: '10',
              status: Status.completed,
            ),
            JobCard(
              restaurantName: 'Restaurant 2',
              weight: '5',
              status: Status.cancelled,
            ),
            JobCard(
              restaurantName: 'Restaurant 3',
              weight: '2',
              status: Status.ongoing,
            ),
            JobCard(
              restaurantName: 'Restaurant 4',
              weight: '345',
              status: Status.cancelled,
            ),
            JobCard(
              restaurantName: 'Restaurant 5',
              weight: '6',
              status: Status.completed,
            ),
            JobCard(
              restaurantName: 'Restaurant 6',
              weight: '4',
              status: Status.cancelled,
            ),
            JobCard(
              restaurantName: 'Restaurant 7',
              weight: '23',
              status: Status.completed,
            ),
            JobCard(
              restaurantName: 'Restaurant 8',
              weight: '1',
              status: Status.ongoing,
            ),
          ],
        ),
      )),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.restaurantName,
    required this.weight,
    required this.status,
  });

  final String restaurantName;
  final String weight;
  final Status status;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.azureBlue,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.business_rounded,
                    color: AppColors.white,
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      restaurantName,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.scale_rounded,
                    color: AppColors.white,
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '$weight kg',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.hourglass_bottom_rounded,
                    color: AppColors.white,
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: status == Status.completed
                              ? const Color.fromARGB(255, 12, 141, 0)
                              : status == Status.cancelled
                                  ? AppColors.red
                                  : AppColors.lightSteelBlue,
                          border: Border.all(color: AppColors.royalBlue)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        status == Status.completed
                            ? 'Task Completed'
                            : status == Status.cancelled
                                ? 'Task Cancelled'
                                : 'Task Ongoing',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Status {
  completed,
  ongoing,
  cancelled,
}
