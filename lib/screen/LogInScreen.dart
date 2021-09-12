// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors

import 'package:apiproject1demo/Services/Api_Services.dart';
import 'package:apiproject1demo/screen/product_list_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final _formKey =GlobalKey<FormState>();

  final TextEditingController _cntEmail= TextEditingController();
  final TextEditingController _cntPassword=TextEditingController();
   bool stutas=true;

  callLogInApi(){
    //final serv
    final service = ApiServices();

    service.apiCallLogin(
      {
        "email": _cntEmail.text,
        "password": _cntPassword.text,
      },
    ).then((value){
      if(value.status.toString()=="201"){
        print(">>>>>"+value.status.toString()+"<<<<<");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProductList()), (route) => false);
        //stutas=false;
      }
      else{
        if(value.error != null){
          print("get data >>>>>> " + value.error!);
        }else{
          print(value.token!);
          //push
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/img3.jpg"),
                    radius: 80,
                  ),
                  SizedBox(height:20,),
                  Text("Log In",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue
                    ),
                  ),
                  SizedBox(height: 20,),
                  _buildEmailInput(_cntEmail),
                  _buildPasswordInput(_cntPassword),
                  _buildSignInButton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildEmailInput(TextEditingController _cntEmail) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
          controller: _cntEmail,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: IconButton(
              icon: Icon(
                Icons.mail,
                color: Color(0xff2162AF),
              ),
              onPressed: () {

              },
            ),
            hintText: "Email",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email address can\'t be empty';
            }
            return null;
          }),
    );
  }
  Widget _buildPasswordInput(TextEditingController _cntPassword){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextFormField(
        controller: _cntPassword,
        maxLines: 1,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: IconButton(
            icon: Icon(
              Icons.mail,
              color: Color(0xff2162AF),
            ),
            onPressed: (){

            },
          ),
          hintText: "Password",
        ),
        validator: (value){
          if(value==null ||value.isEmpty){
            return 'Password address can\'t be empty';
          }
          return null;
        },
        //keyboardType: TextInputType.,
      ),
    );
  }
  Widget _buildSignInButton(){
    return ElevatedButton(
        onPressed: (){
          callLogInApi();
//          if(stutas==false){
//            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProductList()), (route) => false);
//          }
        },
        child: Text("Log in")
    );
  }
//  Widget _buildSignupBtn() {
//    return FlatButton(
//        minWidth: MediaQuery.of(context).size.width,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Text(
//              'Don\'t have an account?\t',
//              style: TextStyle(color: Colors.black, fontSize: 13),
//            ),
//            Text(
//              'Signup',
//              style: TextStyle(color: Colors.blue, fontSize: 13),
//            ),
//          ],
//        ),
//        onPressed: () {
//          Navigator.pushNamed(context, '/signup');
//        });
//  }
}
