import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapptask/repositories/local_repo.dart';
import 'package:loginapptask/screens/home.dart';
import 'package:loginapptask/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen()
    );

  }

}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  late BuildContext context;
  late Widget currentWidget = const Home();


  @override
  void initState() {
    super.initState();
    checkFirstUse();
  }


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return AnimatedSplashScreen.withScreenFunction(
      splash: const Icon(Icons.wallpaper_sharp, size: 150,),
      duration: 5,
      screenFunction: () async{
        return StartScreen(currentWidget: currentWidget);
      },
      splashIconSize: 200,
      splashTransition: SplashTransition.fadeTransition,
    );
  }

  checkFirstUse() async {

    bool login = await LocalRepo().getLoginState();

    WidgetsFlutterBinding.ensureInitialized();
    if(login){
      setState(() {
        currentWidget = const Home();
      });
    }else{
      setState(() {
        currentWidget = const Welcome();
      });
    }

  }

}

class StartScreen extends StatelessWidget {
  // This widget is the root of your application.

  final Widget currentWidget;

  const StartScreen({Key? key, required this.currentWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoginApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepOrange
        )
      ),
      home: currentWidget,
    );

  }

}