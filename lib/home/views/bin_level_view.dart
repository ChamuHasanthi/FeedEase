import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';

class BinLevelView extends StatelessWidget {
  const BinLevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bin Level',
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
            BinCard(
              binLocation: 'Kelaniya',
              binName: 'Food Bin 1',
              level: BinLevel.high,
            ),
            BinCard(
              binLocation: 'Peliyagoda',
              binName: 'Food Bin 2',
              level: BinLevel.low,
            ),
            BinCard(
              binLocation: 'Kadawaththa',
              binName: 'Food Bin 3',
              level: BinLevel.medium,
            )
          ],
        ),
      )),
    );
  }
}

class BinCard extends StatelessWidget {
  const BinCard({
    super.key,
    required this.binName,
    required this.binLocation,
    required this.level,
  });

  final String binName;
  final String binLocation;
  final BinLevel level;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.azureBlue,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.delete,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      binName,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white),
                    ),
                  ]),
                  Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.place,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      binLocation,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white),
                    ),
                  ]),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                level == BinLevel.high
                    ? 'High'
                    : level == BinLevel.low
                        ? ' Low'
                        : 'Medium',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: level == BinLevel.high
                        ? AppColors.red
                        : level == BinLevel.low
                            ? Colors.white
                            : Colors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum BinLevel {
  low,
  high,
  medium,
}
