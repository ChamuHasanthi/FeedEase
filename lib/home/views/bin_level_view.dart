import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BinLevelView extends StatefulWidget {
  const BinLevelView({Key? key}) : super(key: key);

  @override
  _BinLevelViewState createState() => _BinLevelViewState();
}

class _BinLevelViewState extends State<BinLevelView> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref(); // Updated

  String bin1Level = "loading";

  @override
  void initState() {
    super.initState();
    // Listen for real-time changes in the bin level
    _database.child("bin1/level").onValue.listen((event) {
      setState(() {
        bin1Level = event.snapshot.value.toString(); // Cast to String
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bin Level',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // Color code list first
              const ColorCodeList(),
              const SizedBox(height: 20), // Space between color code and bin card
              BinCard(
                binLocation: 'Kelaniya',
                binName: 'Food Bin 1',
                level: bin1Level,
              ),
              // You can add more BinCard widgets here for other bins if needed
            ],
          ),
        ),
      ),
    );
  }
}

class BinCard extends StatelessWidget {
  const BinCard({
    required this.binName,
    required this.binLocation,
    required this.level,
  });

  final String binName;
  final String binLocation;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
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
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      binName,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ]),
                  Row(children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      binLocation,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ]),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                level,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: level == "Level 5"
                        ? Colors.red
                        : level == "Level 4"
                        ? Colors.orange
                        : level == "Level 3"
                        ? Colors.yellow
                        : level == "Level 2"
                        ? Colors.green
                        : Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorCodeList extends StatelessWidget {
  const ColorCodeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Coding System:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        _colorCodeItem('Level 5', Colors.red),
        _colorCodeItem('Level 4', Colors.orange),
        _colorCodeItem('Level 3', Colors.yellow),
        _colorCodeItem('Level 2', Colors.green),
        _colorCodeItem('Level 1', Colors.blue),
      ],
    );
  }

  Widget _colorCodeItem(String level, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(width: 10),
        Text(level),
      ],
    );
  }
}
