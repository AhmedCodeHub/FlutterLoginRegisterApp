import 'package:flutter/material.dart';


class ProgressBar extends StatelessWidget {

  final Color backgroundColor;
  final Color color;
  final Color containerColor;
  final double borderRadius;
  final String text;
  //final VoidCallback onTap;

  const ProgressBar(
      {Key? key,
        this.backgroundColor = Colors.black54,
        this.color = Colors.white,
        this.containerColor = Colors.transparent,
        this.borderRadius = 10.0,
        required this.text
      }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.all(
                        Radius.circular(borderRadius))),
              ),
            ),
            Center(
              child: _getCenterContent(),
            )
          ],
        ));
  }

  Widget _getCenterContent() {
    if (text.isEmpty) {
      return _getCircularProgress();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getCircularProgress(),
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
            child: Text(
              text,
              style: TextStyle(color: color),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircularProgress() {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color));
  }


}