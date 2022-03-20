// import 'dart:developer';
// import 'dart:math';
//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class CallApi{
// final String _url="http://www.varthaga.com/api/register";
//
// postData(data, String) async {
// var fulUrl=_url;
//    return  http.post(Uri.parse(fulUrl),
//       headers: _setHeaders(),
//   body: jsonEncode(data),
//   );
// }
//
// _setHeaders()=>{
//   'Content-type':'application/json',
//   'Accept':'application/json',
// };
// }


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.name,
    required this.userName,
    required this.mobile,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
    required this.referalCode,
  });

  String name;
  String userName;
  String mobile;
  String email;
  String password;
  String passwordConfirmation;
  String gender;
  String referalCode;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    userName: json["user_name"],
    mobile: json["mobile"],
    email: json["email"],
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
    gender: json["gender"],
    referalCode: json["referal_code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_name": userName,
    "mobile": mobile,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "gender": gender,
    "referal_code": referalCode,
  };
}
