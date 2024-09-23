import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'job_card.dart';

class JobView extends StatefulWidget {
  const JobView({super.key});

  @override
  State<JobView> createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('requests');
  List<Map<dynamic, dynamic>> jobs = [];

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  void _fetchJobs() {
    databaseRef.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() {
        jobs = data.entries.map((entry) {
          return Map<String, dynamic>.from(entry.value)..['id'] = entry.key;
        }).toList();
        _sortJobs();
      });
    });
  }

  void _sortJobs() {
    jobs.sort((a, b) {
      if (a['status'] == 'completed' || a['status'] == 'cancelled') {
        return 1; // Move 'a' to the end
      }
      if (b['status'] == 'completed' || b['status'] == 'cancelled') {
        return -1; // Move 'b' to the end
      }
      return 0; // Keep order
    });
  }

  void _updateStatus(String jobId, Status newStatus) {
    final DatabaseReference jobRef = databaseRef.child(jobId);
    jobRef.update({
      'status': newStatus.toString().split('.').last, // Update status to a string
    }).then((_) {
      _fetchJobs(); // Fetch jobs again to reflect changes
    });
  }

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
          child: ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return JobCard(
                jobId: job['id'] ?? 'unknown',
                restaurantName: job['restaurant'] ?? 'Unknown Restaurant',
                weight: job['quantity']?.toString() ?? '0',
                status: (job['status'] ?? 'available') == 'completed'
                    ? Status.completed
                    : (job['status'] ?? 'available') == 'reserved'
                    ? Status.reserved
                    : (job['status'] ?? 'available') == 'cancelled'
                    ? Status.cancelled
                    : Status.available,
                onStatusChanged: (newStatus) {
                  _updateStatus(job['id'], newStatus); // Pass the job ID and new status
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
