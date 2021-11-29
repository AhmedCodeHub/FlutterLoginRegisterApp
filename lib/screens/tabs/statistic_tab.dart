import 'package:flutter/material.dart';


class StatisticTab extends StatefulWidget {
  const StatisticTab({Key? key}) : super(key: key);

  @override
  _StatisticTabState createState() => _StatisticTabState();
}

class _StatisticTabState extends State<StatisticTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
      ),
      body: const Text("Statistics"),
    );
  }
}
