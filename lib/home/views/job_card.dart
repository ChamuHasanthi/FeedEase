import 'package:flutter/material.dart';
import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:firebase_database/firebase_database.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.jobId,
    required this.restaurantName,
    required this.weight,
    required this.status,
    required this.onStatusChanged,
  }) : super(key: key);

  final String jobId;
  final String restaurantName;
  final String weight;
  final Status status;
  final Function(Status) onStatusChanged; // Function to handle status changes

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
                      width: 140, // Increase the width as needed
                      decoration: BoxDecoration(
                        color: Colors.grey, // Set the background color
                        borderRadius:
                            BorderRadius.circular(5), // Optional: round corners
                      ),
                      child: DropdownButton<Status>(
                        value: status,
                        dropdownColor: AppColors.azureBlue,
                        onChanged: (Status? newStatus) {
                          if (newStatus != null) {
                            onStatusChanged(
                                newStatus); // Call the passed function
                          }
                        },
                        items: const [
                          DropdownMenuItem(
                            value: Status.available,
                            child: Text(
                              'Available',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                          DropdownMenuItem(
                            value: Status.reserved,
                            child: Text(
                              'Reserved',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                          DropdownMenuItem(
                            value: Status.completed,
                            child: Text(
                              'Completed',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                          DropdownMenuItem(
                            value: Status.cancelled,
                            child: Text(
                              'Cancelled',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ],
                        style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18), // Increase font size
                        underline: SizedBox(), // Remove the default underline
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Status {
  available,
  reserved,
  completed,
  cancelled,
}
