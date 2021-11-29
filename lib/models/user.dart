

class User{

  late int id;
  String name;
  String email;
  late String password;
  late String passwordConfirmation;
  String gender;
  late String birth;
  late int age;


  User(this.id, this.name, this.email, this.gender, this.age);

  User.signup(this.name, this.email, this.password, this.passwordConfirmation, this.birth, this.gender);

  factory User.formJson(dynamic json){
    return User(
        json['id'],
        json['name'],
        json['email'],
        json['gender'],
        json['age']
    );
  }


}