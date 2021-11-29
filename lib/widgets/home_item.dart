import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeItem extends StatelessWidget {

  final String title;
  final IconData? iconData;
  final VoidCallback? press;

  const HomeItem({Key? key, required this.title, this.iconData, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10
              )
            ]
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(iconData, size: 100, color: Colors.deepOrange,),
              ),
            ],
          ),
        ),
        onTap: press
    ), flex: 1,);
  }
}