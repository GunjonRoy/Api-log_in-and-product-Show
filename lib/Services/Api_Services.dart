
// ignore_for_file: file_names

import 'dart:convert';

import 'package:apiproject1demo/Services/LoginApiResponse.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  //Future<LoginApiResponse> api

  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic>param)async{
    var url = Uri.parse('https://api.sakkhar.com/api/login');
    var response = await http.post(url, body: param);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //print(await http.read(Uri.parse('https://api.sakkhar.com/api/login')));
    final data = jsonDecode(response.body);
//    if(response.statusCode.toString()=="201"){
//      //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProductList()), (route) => false);
//      print(">>>>>>"+response.statusCode.toString()+"<<<<<<<<<");
//      return LoginApiResponse(token: data["token"], error: data["error"],status: "${response.statusCode}");
//    }
    return LoginApiResponse(token: data["token"], error: data["error"],status: "${response.statusCode}");
  }


}