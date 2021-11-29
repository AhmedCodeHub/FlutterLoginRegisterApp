import 'package:flutter/material.dart';

import 'clipped_top.dart';

// ignore: must_be_immutable
class TopContainer extends StatelessWidget {
  String userName;
  TopContainer(this.userName, {Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippedTop(),
      child: Container(
        width: double.maxFinite,
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFea4759), Color(0xFFf658ba)])
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Good Morning", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
              Text(userName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45),),
            ],
          ),
        ),
      ),
    );
  }
}