import 'package:loginapptask/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:loginapptask/utils/app_constants.dart';

class UsersRepo{

  Future<dynamic> loginUser(String email, String pass) async {
    final response = await http.post(Uri.parse(AppConstants.baseUrl + "api/login?email=" + email+ "&password=" + pass));
    return response;
  }

  Future<dynamic> signUpUser(User user) async {

    final response = await http.post(
        Uri.parse(AppConstants.baseUrl + "api/register?"
            "name=" + user.name + "&"
            "email=" + user.email + "&"
            "password=" + user.password + "&"
            "password_confirmation=" + user.passwordConfirmation + "&"
            "gender=" + user.gender + "&"
            "birth=" + user.birth
        ));

    return response;
  }

}