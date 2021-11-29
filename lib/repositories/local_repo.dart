import 'package:loginapptask/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo{

  Future<void> saveUserLocal(userdata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var useId = await prefs.setInt('user_id', userdata['id']);
    var name = await prefs.setString('name', userdata['name']);
    var email = await prefs.setString('email', userdata['email']);
    var gender = await prefs.setString('gender', userdata['gender']);
    var age = await prefs.setInt('age', userdata['age']);
    
  }

  Future<void> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenId = await prefs.setString('token', token);
  }

  Future<String> getUSerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }

  Future<User> getLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return User(
        prefs.getInt('user_id')!,
        prefs.getString('name')!,
        prefs.getString('email')!,
        prefs.getString('gender')!,
        prefs.getInt('age')!
    );

  }

  Future<void> setLoginState(login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var useId = await prefs.setBool('login', login);
  }

  Future<bool> getLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login') == null ? false : prefs.getBool('login')!;
  }



}