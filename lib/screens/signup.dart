import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loginapptask/models/user.dart';
import 'package:loginapptask/repositories/local_repo.dart';
import 'package:loginapptask/repositories/users_repo.dart';
import 'package:loginapptask/screens/login.dart';
import 'package:loginapptask/utils/app_constants.dart';
import 'package:loginapptask/widgets/corner_container.dart';
import 'package:loginapptask/widgets/progress.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool male = false;
  bool female = false;
  DateTime selectedDate = DateTime.now();

  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  TextEditingController txtConfPassController = TextEditingController();

  String errorMessages = "";

  UsersRepo usersRepo = UsersRepo();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            const Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget txtUserNameWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Username",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtNameController,
              obscureText: false,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget txtEmailWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Email id",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtEmailController,
              obscureText: false,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget txtPasswordWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget txtConfPassWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Password Confirmation",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtConfPassController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget genderWidget(){
    return Column(
      children: [
        CheckboxListTile(
          value: male,
          selected: male,
          onChanged: (changed){
            setState(() {
              male = true;
              female = false;
            });
          },
          title: const Text("Male"),
        ),
        CheckboxListTile(
          value: female,
          selected: female,
          onChanged: (changed){
            setState(() {
              male = false;
              female = true;
            });
          },
          title: const Text("Female"),
        ),

      ],
    );
  }

  Widget birthWidget(){
    return Column(
      children: [
        TextButton(
          onPressed: (){
            openDateSelector();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xfff7892b))
          ),
          child: Text("Date of Birth \n\n" + selectedDate.toString().substring(0, 10), style: const TextStyle(color: Colors.white),),
        ),
      ],
    );
  }

  Widget signUpWidgetButton() {
    return InkWell(
      onTap: (){
        signUpUser();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: const Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Log',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)
          ),

          children: [
            TextSpan(
              text: 'in',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: ' App',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget signUpForm() {
    return Column(
      children: <Widget>[
        txtUserNameWidget(),
        txtEmailWidget(),
        txtPasswordWidget(),
        txtConfPassWidget(),
        genderWidget(),
        birthWidget()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const CornerContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(errorMessages, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    ),
                    signUpForm(),
                    const SizedBox(
                      height: 20,
                    ),
                    signUpWidgetButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }

  Future<void> openDateSelector() async {
    DateTime dateTime = DateTime(selectedDate.year, selectedDate.month, selectedDate.day + 1);
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> signUpUser() async {

    if(txtNameController.text == ""){
      showMessage("Enter User Name", Colors.red);
      return;
    }

    if(txtEmailController.text == ""){
      showMessage("Enter an Email", Colors.red);
      return;
    }

    if(txtPasswordController.text == ""){
      showMessage("Enter a Password", Colors.red);
      return;
    }

    if(txtConfPassController.text == ""){
      showMessage("Enter a Confirmation Password", Colors.red);
      return;
    }

    if(male == false && female == false){
      showMessage("Select Gender Type", Colors.red);
      return;
    }

    if(selectedDate.year == DateTime.now().year){
      showMessage("Birth Date Should not be in The Same Year", Colors.red);
      return;
    }

    var progress = const ProgressBar(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: AppConstants.kPrimaryColor,
      borderRadius: 5.0,
      text: "Signing up..",
    );

    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: progress,
        );
      },
    );

    User user = User.signup(
        txtNameController.text,
        txtEmailController.text,
        txtPasswordController.text,
        txtConfPassController.text,
        DateFormat('dd/MM/yyyy').format(selectedDate).toString(),
        male ? "Male" : "Female"
    );
    
    var res = await usersRepo.signUpUser(user);
    var data = json.decode(res.body);
    errorMessages = "";

    if(res.statusCode == 200){ // signup success
      await LocalRepo().saveUserLocal(data['user']);
      await LocalRepo().saveUserToken(data['token']);
      await LocalRepo().setLoginState(true);
      Navigator.pop(context);
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (BuildContext context) => const Home()));
    }else if(res.statusCode == 403){
      errorMessages = data['message'];
      Navigator.pop(context);
      setState(() {
        errorMessages;
      });
    }else{
      if(data['password'] != null){
        for(var item in data['password']){
          errorMessages += item + "\n";
        }
      }
      if(data['email'] != null){
        for(var item in data['email']){
          errorMessages += item + "\n";
        }
      }
      if(data['name'] != null){
        for(var item in data['name']){
          errorMessages += item + "\n";
        }
      }
      if(data['gender'] != null){
        for(var item in data['gender']){
          errorMessages += item + "\n";
        }
      }
      if(data['birth'] != null){
        for(var item in data['birth']){
          errorMessages += item + "\n";
        }
      }
      Navigator.pop(context);
      setState(() {
        errorMessages;
      });
    }

  }

  void showMessage(String msg, color){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}