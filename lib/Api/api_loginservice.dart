import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:reffralacc/Model/login_model.dart';


class APIservice{
Future<LoginResponseModel>login(LoginRequestModel requestModel) async{
  final response =await http.post(Uri.parse("https://reqres.in/api/login"),body: requestModel.toJson());
  if(response.statusCode ==200||response.statusCode==400) {
    return LoginResponseModel.fromJson(json.decode(response.body));
  }
  else{
    throw Exception("faild to load data");
  }
}

}