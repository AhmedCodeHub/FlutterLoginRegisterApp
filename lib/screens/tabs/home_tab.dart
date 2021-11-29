import 'package:flutter/material.dart';
import 'package:loginapptask/models/user.dart';
import 'package:loginapptask/repositories/local_repo.dart';
import 'package:loginapptask/widgets/home_item.dart';
import 'package:loginapptask/widgets/top_container.dart';



class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  User? currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopContainer(currentUser == null ? "" : currentUser!.name),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(width: 10,),
                HomeItem(title: "Walking", iconData: Icons.directions_walk,),
                SizedBox(width: 10,),
                HomeItem(title: "Cycling", iconData: Icons.motorcycle,),
                SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(width: 10,),
                HomeItem(title: "Driving", iconData: Icons.drive_eta,),
                SizedBox(width: 10,),
                HomeItem(title: "Train", iconData: Icons.train_outlined,),
                SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(width: 10,),
                HomeItem(title: "Hiking", iconData: Icons.hiking,),
                SizedBox(width: 10,),
                HomeItem(title: "Flight", iconData: Icons.flight,),
                SizedBox(width: 10,),
              ],
            ),
          ],
        ),
      )
    );
  }

  Future<void> getLocalData() async {
    currentUser = await LocalRepo().getLocalUser();
    setState(() {
      currentUser;
    });
  }


}