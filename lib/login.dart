import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclesportal/register.dart';

import 'bottomuser.dart';

import 'const.dart';
import 'navbar.dart';

class Homelog extends StatefulWidget {
  const Homelog({Key? key}) : super(key: key);

  @override
  State<Homelog> createState() => _HomelogState();
}

class _HomelogState extends State<Homelog> {
  var Email = TextEditingController();
  var Password = TextEditingController();
  bool _validateFields() {
    if (Email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter email');
      return false;
    }
    if (Password.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter password');
      return false;
    }
    return true;       
  }

  Future<void> getData() async {
    if (!_validateFields()) return;
    var data = {
      "email": Email.text,
      "password": Password.text,
    };
    var response = await post(Uri.parse('${Con.url}login.php'),body: data);
    var res = jsonDecode(response.body);
    print(res);

   if (response.statusCode == 200) {
  if (res['message'] == 'User Successfully LoggedIn') {
    var id = res['log_id'];
    final spref = await SharedPreferences.getInstance();
    spref.setString('regi_id', id);

    if (res['type'] == 'user') {
      Fluttertoast.showToast(msg: 'Successfully logged in as user');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return nav();
      }));
    } else if (res['type'] == 'provider') {
      Fluttertoast.showToast(msg: 'Successfully logged in as provider');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Homeee();
      }));
    }
  } else {
    Fluttertoast.showToast(msg: 'Invalid username or password');
  }
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login",style: TextStyle(color: Colors.black),),
      //   backgroundColor: Colors.blue,
      //   centerTitle: true,
      // ),
       backgroundColor: Colors.grey.shade400,
      body: Container(
        decoration: BoxDecoration(
         // image: DecorationImage(
           // image: AssetImage("assets/Free Instagram Story Template.jpg"),
          //  fit: BoxFit.fill,
        //  ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text('LogIn'),
                //  ] ,
                // ),
             Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Text("Welcome Back!!",style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
                child: Container(
                  width: 350,
                  child: TextField(
                    controller:Email ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText:"Email",hintText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0,top:10.0),
                child: Container(
                  width: 350,
                  child: TextField(
                    controller: Password,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText:"Password",hintText: "Password",
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  getData();

                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 88.0,right: 90.0),
                  child: Container(
                    child: Center(child: Text('Login')),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    height: 30,
                    width: 150,

                  ),
                ),
              ),
              TextButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Register()));
              }, child: Text("Don't have any account please Register here!",style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      ),
      )
    );
  }
}